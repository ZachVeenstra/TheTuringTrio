//
//  HomeView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI
import FirebaseAuth



struct HomeView: View {
    private let posts = [PostView(), PostView()]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    ForEach(posts, id: \.self) { post in
                        post
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement:.topBarLeading) {
                    Button("Logout") {
                        do { try Auth.auth().signOut() }
                        catch { print("already logged out") }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: EditJournalView()) {
                        Label("Create Journal", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Label("Go to profile", systemImage: "person.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
