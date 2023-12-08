//
//  ProfileView.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/7/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore


struct ProfileView: View {
    @ObservedObject var viewModel = UserProfileViewModel()
    @State private var isSignInPresented = false
    
    var body: some View {
        if let user = viewModel.user {
            VStack(alignment: .leading, content: {
                Spacer()
                HStack {
                    Spacer()
                    if let userPhoto = user.photo {
                        Image(uiImage: userPhoto)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)  // Adjust the size as needed
                            .clipShape(Circle())
                    }
                    else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                    }
                    
                    Spacer()}
                Spacer()
                NavigationLink(destination: EditProfileView()) {
                    Text("Edit Profile")

                }
                .buttonStyle(ActionButton())
                .padding(.top)
                .padding(.bottom)
                
                CustomTextView(text: user.displayName, labelText: "Username")
                
                CustomTextView(text: user.email, labelText: "Email")
                CustomTextView(text: user.bio, labelText: "Bio")
                
                Spacer()
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
            .onAppear {
                viewModel.fetchCurrentUserData()
                if Auth.auth().currentUser == nil {
                    isSignInPresented = true
                }
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $isSignInPresented) {
                AuthenticationView()
            }
        } else {
            CircularLoadingView()
            .padding()
        }
        
    }
}
