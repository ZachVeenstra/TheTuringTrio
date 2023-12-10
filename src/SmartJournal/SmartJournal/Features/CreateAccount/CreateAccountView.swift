//
//  CreateAccountView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import SwiftUI
import FirebaseAuth
import AlertToast

struct CreateAccountView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showErrorToast = false
    @State private var toastMessage = String()
    
    private let STACK_SPACING: CGFloat = 50
    
    var body: some View {
        VStack (spacing: STACK_SPACING) {
            Text("Create Account")
                .font(.title)
                .fontWeight(.semibold)
            
            VStack {
                TextField("Email", text: $email)
                    .modifier(InputField())
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                TextField("Username", text: $username)
                    .modifier(InputField())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .modifier(InputField())
                    .textContentType(.oneTimeCode)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .modifier(InputField())
                    .textContentType(.oneTimeCode)
                
                Button("Create Account") {
                    createAccount(email: email, password: password, username: username, confirm_password: confirmPassword) { success, error in
                        
                        if !success  {
                            self.showErrorToast.toggle()
                            self.toastMessage = error?.localizedDescription ?? "Unknown error"
                        }
                    }
                }
                .buttonStyle(ActionButton())
                .toast(isPresenting: $showErrorToast) {
                    AlertToast(displayMode: .banner(.pop), type: .error(.red), title: toastMessage)
                }
            }
            .padding()
        }
    }
    
    private func createAccount(email: String, password: String, username: String, confirm_password: String, completion: @escaping (Bool, Error?) -> Void) {
        let firebaseManager = FirebaseManager.shared
        
        firebaseManager.createAccountAndAddUser(email: email, username: username, password: password, con_password: confirm_password) { result in
            switch result {
            case .success(let userProfile):
                print("User registered successfully: \(userProfile.displayName)")
                completion(true, nil)
            case .failure(let error):
                print("Error signing up: \(error.localizedDescription)")
                completion(false, error)
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
