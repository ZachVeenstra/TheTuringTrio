//
//  EditJournalView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/15/23.
//

import SwiftUI
import PhotosUI

struct EditJournalView: View {
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        VStack {
            VStack {
                if viewModel.photos.isEmpty {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                } else {
                    ImageCarousel(photos: viewModel.photos)
                }
                
                PhotosPicker(selection: $viewModel.imageSelections, matching: .images) {
                    Text("Upload Photos")
                }
                .buttonStyle(ActionButton())
            }
            
            VStack {
                TextEditor(text: $viewModel.journalData.body)
                    .border(.black)
            }
            
            .toolbar {
                Button(action: viewModel.saveJournal) {
                    HStack (alignment: .top) {
                        Text("Save")
//                        Image(systemName: "chevron.forward")
                    }
                }
            }
        }
        .padding()
    }
}

func navigateToAttributes() {
    
}

#Preview {
    NavigationStack {
        EditJournalView()
    }
}
