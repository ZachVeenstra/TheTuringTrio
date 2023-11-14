//
//  CreateAccountView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import SwiftUI

struct CreateAccountView: View {
    
    @StateObject var authenticationState: UserAuthenticationState()
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var con_password = ""
    
    private let STACK_SPACING: CGFloat = 50
    
    var body: some View {
        NavigationStack {
            VStack (spacing: STACK_SPACING) {
                VStack{
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Image(systemName: "book")
                        .font(.system(size:100))
                }
                
                VStack {
                    TextField("Email", text: $email)
                        .modifier(InputField())
                    
                    TextField("Username", text: $username)
                        .modifier(InputField())
                    
                    TextField("Password", text: $password)
                        .modifier(InputField())
                    
                    TextField("Confirm Password", text: $con_password)
                        .modifier(InputField())
                    
                    Button(action: login) {
                        Text("Login")
                    }
                    .buttonStyle(ActionButton())
                }
                
                VStack {
                    HStack{
                        Text("Click ")
                        
                        NavigationLink("Here") {
                            AuthenticationView()
                                .foregroundStyle(Color.blue)
                        }
                        
                        Text(" to return to the login page")
                        
                    }
                }
                .padding()
            }
        }
        }
    }


#Preview {
    CreateAccountView()
}
