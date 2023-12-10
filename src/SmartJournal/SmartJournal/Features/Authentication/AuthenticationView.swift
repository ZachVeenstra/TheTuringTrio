//
//  AuthenticationView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import AlertToast


struct AuthenticationView: View {
    
    var user: User?
    
    @EnvironmentObject var authenticationState: UserAuthenticationState
    @State private var email = ""
    @State private var password = ""
    @State private var showErrorToast = false
    
    private let STACK_SPACING: CGFloat = 50
    
    var body: some View {
        VStack (spacing: STACK_SPACING) {
            VStack{
                Text("Smart Journal")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Image(systemName: "book")
                    .font(.system(size:100))
            }
            
            VStack {
                TextField("Email", text: $email)
                    .modifier(InputField())
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .modifier(InputField())
                
                Button("Login") {
                    login(email: email, password: password) { success in
                        if !success  {
                            self.showErrorToast.toggle()
                        }
                    }
                }
                .buttonStyle(ActionButton())
                .toast(isPresenting: $showErrorToast) {
                    AlertToast(displayMode: .alert, type: .error(.red), title: String())
                }
            }
            
            VStack {
                NavigationLink("Create Account") {
                    CreateAccountView()
                }
                .buttonStyle(ActionButton())
            }
        }
        .padding()
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing in:", error.localizedDescription)
                completion (false)
            } else if let _ = authResult?.user {
                print("Success")
                completion (true)
            }
        }
    }}

#Preview {
    AuthenticationView()
}

