//
//  CreateAccountView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountView: View {

    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var con_password = ""

    private let STACK_SPACING: CGFloat = 50

    var body: some View {
        NavigationStack {
            VStack (spacing: STACK_SPACING) {
                Text("Create Account")
                    .font(.title)
                    .fontWeight(.semibold)

                VStack {
                    TextField("Email", text: $email)
                        .modifier(InputField())

                    TextField("Username", text: $username)
                        .modifier(InputField())

                    SecureField("Password", text: $password)
                        .modifier(InputField())

                    SecureField("Confirm Password", text: $con_password)
                        .modifier(InputField())

                    Button(action: {}) {
                        Text("Login")
                    }
                    .buttonStyle(ActionButton())
                }
                .padding()
            }
        }
        func create_account(email: String, username: String, password: String, con_password: String) {
            auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                } else {
                    print("sucess")
                }
                }
            }
    }
}

#Preview {
    CreateAccountView()
}
