//
//  HomeView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct Journal: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var body: String
    var owner: String
    var photos: [String]
}

struct HomeView: View {
    @State private var journals: [Journal] = []

    var body: some View {
        NavigationView {
            List(journals) { journal in
                VStack(alignment: .leading) {
                    Text(journal.title)
                        .font(.headline)
                    Text(journal.body)
                        .foregroundColor(.gray)
                }
                .padding()
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
}


#Preview {
    HomeView()
}
