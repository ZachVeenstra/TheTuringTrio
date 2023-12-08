//
//  EditProfile.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/14/23.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore
import FirebaseCore

import SwiftUI

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var viewModel = UserProfileViewModel()
    @State private var newName: String = ""
    @State private var newBio: String = ""
    @State private var newEmail: String = ""
    @State private var newPassword: String = ""
    @State private var profilePic: String = ""
    @State private var profilePicture: UIImage?
    
    @State private var isLoading = false
    
    let radius: CGFloat = 100
    var offset: CGFloat {
        sqrt(radius * radius / 2)
    }
    
    @StateObject private var viewModelPhotoPicker = SinglePhotoPickerViewModel()
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, content: {
            
            HStack(content: {
                Spacer()
                HStack {
                    Spacer()
                    if (viewModelPhotoPicker.photo == nil) {
                        if let user = viewModel.user {
                            if let image = user.photo {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .clipShape(Circle())
                                    .overlay(
                                        PhotosPicker(selection: $viewModelPhotoPicker.imageSelection, matching: .images) {
                                            Image(systemName: "camera.fill")
                                                .foregroundColor(.primary)
                                                .padding(8)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                                .background(
                                                    Circle()
                                                        .stroke(Color.gray, lineWidth: 2)
                                                )
                                        }.offset(x: offset, y: offset)
                                    )
                            }
                            else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .overlay(
                                        PhotosPicker(selection: $viewModelPhotoPicker.imageSelection, matching: .images) {
                                            Image(systemName: "camera.fill")
                                                .foregroundColor(.primary)
                                                .padding(8)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                                .background(
                                                    Circle()
                                                        .stroke(Color.gray, lineWidth: 2)
                                                )
                                        }.offset(x: offset, y: offset)
                                    )
                            }
                        }
                        
                    }
                    
                    else {
                        Image(uiImage: viewModelPhotoPicker.photo ?? UIImage(systemName: "person.circle.fill")!)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(
                                PhotosPicker(selection: $viewModelPhotoPicker.imageSelection, matching: .images) {
                                    Image(systemName: "camera.fill")
                                        .foregroundColor(.primary)
                                        .padding(8)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .background(
                                            Circle()
                                                .stroke(Color.gray, lineWidth: 2)
                                        )
                                }.offset(x: offset, y: offset)
                            )
                    }
                    
                
                    Spacer()}
            
                Spacer()
                
            })
            LabelsForTextFields(labelText: "Bio")
            
            TextField("Enter your bio", text: $newBio)
                .modifier(InputField())
            
            LabelsForTextFields(labelText: "Email")
            TextField("Email", text: $newEmail)
                .modifier(InputField())
            
            LabelsForTextFields(labelText: "Username")
            TextField("Username", text: $newName)
                .modifier(InputField())
            
            LabelsForTextFields(labelText: "Password")
            SecureField("Password", text: $newPassword)
                .modifier(InputField())
            
            
            Button("Save Changes") {
                isLoading = true
                
                if let selectedImage = viewModelPhotoPicker.photo {
                    // Upload the selected image to Firebase Storage
                    viewModel.uploadProfileImage(userID: viewModel.user?.id ?? "", image: selectedImage) { result in
                        switch result {
                        case .success(let imageURL):
                            // Update the user's profile with the imageURL
                            viewModel.updateProfile(name: newName, email: newEmail, bio: newBio, profileImageUrl: imageURL)
                            print("image uploaded successfully")
                            isLoading = false

                            // Dismiss the view
                            presentationMode.wrappedValue.dismiss()

                        case .failure(let error):
                            print("Error uploading profile image: \(error.localizedDescription)")
                            isLoading = false
                        }
                    }
                    
                } else {
                    viewModel.updateProfile(name: newName, email: newEmail, bio: newBio, profileImageUrl: profilePic)
                    isLoading = false
                    
                    // Dismiss the view
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .buttonStyle(ActionButton())
            .padding(.top)
            .padding(.bottom)
            
            if isLoading {
                CircularLoadingView() 
                    .padding() // Display the loading indicator if isLoading is true
            }
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(30)
        .onAppear {
            viewModel.fetchCurrentUserData()
            newName = viewModel.user?.displayName ?? ""
            newBio = viewModel.user?.bio ?? ""
            newEmail = viewModel.user?.email ?? ""
            profilePic = viewModel.user?.photoURL ?? "person.circle.fill"
            profilePicture = viewModel.user?.photo
        }
    }
    public func convert(image: Image, callback: @escaping ((UIImage?) -> Void)) {
        DispatchQueue.main.async {
            let renderer = ImageRenderer(content: image)

            // to adjust the size, you can use this (or set a frame to get precise output size)
            // renderer.scale = 0.25
            
            // for CGImage use renderer.cgImage
            callback(renderer.uiImage)
        }
    }
}
