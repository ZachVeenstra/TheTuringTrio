//
//  HomeView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import Kingfisher

struct Journal: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var body: String
    var owner: String
    var photos: [String]
}

struct HomeView: View {
    @State private var journals: [Journal] = []
    @State private var downloadedImages: [String: [UIImage]] = [:]
    
    var body: some View {
        NavigationView {
            List(journals) { journal in
                VStack(alignment: .leading) {
                    let entryImages = downloadedImages[journal.id ?? ""]
                    ImageCarousel(photos: downloadedImages[journal.id ?? ""] ?? [])
                    .frame(height: 200)
                    .onAppear {
                        downloadImages(for: journal)
                    }

                    Text(journal.title)
                        .font(.headline)
                    Text(journal.body)
                        .foregroundColor(.gray)
                    
                }
                //.padding()
            }
            .onAppear {
                fetchJournals()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Logout") {
                        do {
                            try Auth.auth().signOut()
                        } catch {
                            print("Already logged out")
                        }
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: EditJournalView()) {
                        Label("Create Journal", systemImage: "plus")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Label("Go to profile", systemImage: "person.circle")
                    }
                }
            }
        }
    }

    private func fetchJournals() {
        let collectionRef = Firestore.firestore().collection("journals")

        collectionRef.addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching journals: \(error.localizedDescription)")
                return
            }
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }
            journals = documents.compactMap { document in
                do {
                    let journalData = try document.data(as: Journal.self)
                    return journalData
                } catch {
                    print("Error decoding journal data: \(error.localizedDescription)")
                    return nil
                }
            }
        }
    }
    private func loadImages(from photoURLs: [String]) -> [UIImage] {
        var images: [UIImage] = []

        for photoURL in photoURLs {
            // Assuming "JournalImages" is the folder in Firebase Storage
            let storageReference = Storage.storage().reference().child("JournalImages/").child(photoURL)

            storageReference.getData(maxSize: Int64.max) { data, error in
                if let error = error {
                    print("Error fetching image data for \(photoURL): \(error.localizedDescription)")
                } else if let data = data, let image = UIImage(data: data) {
                    images.append(image)
                }
            }
        }

        return images
    }
    private func downloadImages(for journal: Journal) {
        guard let journalID = journal.id else { return }
            for photoURL in journal.photos {
                let storageRef = Storage.storage().reference(forURL: photoURL)

                storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                    if let error = error {
                        print("Error downloading image: \(error)")
                    } else {
                        if let data = data, let image = UIImage(data: data) {
                            // Update the downloaded images for the specific journal entry
                            DispatchQueue.main.async {
                                if var entryImages = downloadedImages[journalID] {
                                    entryImages.append(image)
                                    downloadedImages[journalID] = entryImages
                                } else {
                                    downloadedImages[journalID] = [image]
                                }
                            }
                        }
                    }
                }
            }
        }

}


#Preview {
    HomeView()
}
