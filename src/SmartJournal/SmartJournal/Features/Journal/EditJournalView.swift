//
//  EditJournalView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/15/23.
//

import SwiftUI
import PhotosUI

struct EditJournalView: View {
    @StateObject private var viewModel = MultiplePhotoPickerViewModel()
    @State private var text = String()
    
    var body: some View {
        NavigationStack() {
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
                    Button(action: navigateToAttributes) {
                        HStack (alignment: .top) {
                            Text("Next")
                            Image(systemName: "chevron.forward")
                        }
                    }
                }
            }
            .padding()
        }
    }
}
        
func navigateToAttributes() {
    
}

#Preview {
    EditJournalView()
}
