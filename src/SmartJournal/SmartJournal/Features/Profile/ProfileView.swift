//
//  ProfileView.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/7/23.
//

import SwiftUI


struct ProfileView: View {
    
    private let userName = "John Doe"
    private let email = "johndoe@gmail.com"
    private let bio = "Hey I am having fun"
    
    private let image = HashableImage(image: Image(systemName: "photo"))
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading, content: {
                
                
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Spacer()}
                Spacer()
                NavigationLink("Edit Profile") {
                    EditProfile(username: userName, email: email, bio: bio)
                }
                .buttonStyle(ActionButton()) // Apply the custom button style
                .padding(.top)
                .padding(.bottom)
                
                CustomTextView(text: bio, labelText: "Bio")
                    
                CustomTextView(text: email, labelText: "Email")
                CustomTextView(text: userName, labelText: "Username")
                
                Spacer()
                
                
            })
            .navigationTitle(userName)
            .navigationBarBackButtonHidden(true)
            
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
        }
        
        
    }
}

#Preview {
    ProfileView()
}
