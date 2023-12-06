//
//  HomeView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseFirestore


struct Journal: Identifiable, Hashable {
    var id: String
    var name: String?
    var text: String?
}
private let images = [HashableImage(image: Image(systemName: "photo")), HashableImage(image: Image(systemName: "photo"))]


struct HomeView: View {
    
    @State private var journals: [Journal] = []
    
    private let posts = [PostView(), PostView()]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading, content: {
//                    NavigationLink("Profile") {
//                        ProfileView()
//                    }
//                    .buttonStyle(ActionButton())
//                    Spacer()
//                    Button("Logout") {
//                        do { try Auth.auth().signOut() }
//                        catch { print("already logged out") }
//                    }
                    ForEach(journals, id: \.self) { journal in
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                    .padding(10)
                            }
                            
                            ImageCarousel(photos: images)
                                .frame(height: 200)
                                
                            
                            Text(journal.text ?? "No Text")
                                .padding(20)
                        }
                    }
                    
                    
                }
                )
                .onAppear {
                    getJournalsData()
                }
            }
    }
}
    
    func getJournalsData() {
        Firestore.firestore().collection("journals").getDocuments { (snapshot, error) in
            guard let snapshot = snapshot, error == nil else {
                // Handle error
                return
            }

            var loadedJournals: [Journal] = []

            for document in snapshot.documents {
                if let name = document["name"] as? String,
                   let text = document["text"] as? String{
                    let journal = Journal(id: UUID().uuidString, name: name, text: text)
                    loadedJournals.append(journal)

                }
            }

            self.journals = loadedJournals
        }
    }
}

#Preview {
    HomeView()
}
