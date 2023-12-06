//
//  EditJournalView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/15/23.
//

import SwiftUI
import PhotosUI

import Firebase
import FirebaseFirestore
import FirebaseStorage

struct EditJournalView: View {
    @StateObject private var viewModel = MultiplePhotoPickerViewModel()
    @State private var text = String()
    let id = UUID()
    let name = "My journal"
    
    var body: some View {
        VStack {
            VStack {
                if viewModel.photos == [] {
                    ImageCarousel(photos: [HashableImage()])
                } else {
                    ImageCarousel(photos: viewModel.photos)
                }
                
                PhotosPicker(selection: $viewModel.imageSelections, matching: .images) {
                    Text("Upload Photos")
                }
                .buttonStyle(ActionButton())
            }
            
            VStack {
                TextEditor(text: $text)
                    .border(.black)
            }
            
            .toolbar {
                Button {
                    saveJournal(uid: id.uuidString, name: name, body: text, isPublic: true, photos: viewModel.photos)
                } label: {
                    HStack (alignment: .top) {
                        Text("Save")
                        Image(systemName: "chevron.forward")
                    }
                }
            }
        }
        .padding()
    }
}

private func saveJournal(uid: String, name: String, body: String, isPublic: Bool, photos: [HashableImage]) -> Void {
    let journalRef = Firestore.firestore().collection("journals").document(uid)
    var photoUrls: [String] = []
    
    for photo in photos {
        convert(image: photo.image, callback: { image in
            uploadImage(image: image!) { result in
                switch result {
                case .success(let imageURL):
                    photoUrls.append(imageURL)
                    print("Success")
                    
                case .failure(let error):
                    print("Error uploading image: \(error.localizedDescription)")
                }
            }
        })
        
    }
    
    var photosDict: [String: Any] = ["photos": photoUrls]
    
    print(photoUrls)
    
    journalRef.setData([
        "name": name,
        "body": body,
        "isPublic": isPublic,
        "photos": photosDict
    ]) { error in
        if let error = error {
            //            completion(.failure(error))
            print(error.localizedDescription)
        } else {
            //            completion(.success())
            print("User added to Firestore successfully")
        }
    }
}

func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
    
    // Convert the image to Data
    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
        completion(.failure(NSError(domain: "EditJournalView", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
        return
    }
    
    // Create a unique filename for the image
    let fileName = UUID().uuidString
    let storageRef = Storage.storage().reference().child("JournalImages/\(fileName).jpg")
    
    // Upload the image data
    storageRef.putData(imageData, metadata: nil) { (metadata, error) in
        if let error = error {
            completion(.failure(error))
        } else {
            storageRef.downloadURL { (url, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let downloadURL = url {
                    completion(.success(downloadURL.absoluteString))
                    
                } else {
                    completion(.failure(NSError(domain: "EditJournalView", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])))
                }
            }
        }
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

#Preview {
    NavigationStack {
        EditJournalView()
    }
}
