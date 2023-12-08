//
//  JournalViewModel.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 12/8/23.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import FirebaseAuth
import FirebaseStorage

class JournalViewModel: ObservableObject {
    @Published var journalData: JournalModel
    @Published private(set) var photos: [UIImage] = [] {
        didSet {
            journalData.photos = photos
        }
    }
    @Published var imageSelections: [PhotosPickerItem] = [] {
        didSet {
            self.loadTransferable(from: imageSelections)
        }
    }
    
    required init() {
        self.journalData = JournalModel(owner: Auth.auth().currentUser!.uid, isPublic: true, title: "", body: "", photos: [])
    }
    
    // ChatGPT helped me learn how to use a dispatchGroup
    func saveJournal() {
        var imageURLs: [String] = []
        
        let dispatchGroup = DispatchGroup()

        for photo in photos {
            dispatchGroup.enter()
            uploadImage(image: photo) { result in
                defer {
                    dispatchGroup.leave()
                }
                
                switch result {
                case .success(let imageURL):
                    print("Image uploaded successfully. URL: \(imageURL)")
                    imageURLs.append(imageURL)

                case .failure(let error):
                    print("Error image: \(error.localizedDescription)")
                }
            }
        }

        dispatchGroup.notify(queue: .main) {
            let journalRef = Firestore.firestore().collection("journals").document(self.journalData.id.uuidString)
            let journalData: [String: Any] = [
                "owner": self.journalData.owner,
                "isPublic": self.journalData.isPublic,
                "title": self.journalData.title,
                "body": self.journalData.body,
                "photos": imageURLs
            ]
            
            journalRef.setData(journalData) { err in
                if let err = err {
                    print("Error uploading journal: \(err)")
                } else {
                    print("Journal successfully uploaded: \(journalData)")
                }
            }
        }
    }
    
    private func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        
        // Convert the image to Data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "EditProfileView", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
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
                        completion(.failure(NSError(domain: "JournalModel", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])))
                    }
                }
            }
        }
    }
    
    // Learned the use of loadTransferable here: https://developer.apple.com/documentation/photokit/photospicker
    private func loadTransferable(from imageSelections: [PhotosPickerItem]) {
        self.photos.removeAll()
        for imageSelection in imageSelections {
            imageSelection.loadTransferable(type: Data.self) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image?):
                        self.photos.append(UIImage(data: image)!)
                    case .success(nil):
                        print("Photo was nil.")
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
