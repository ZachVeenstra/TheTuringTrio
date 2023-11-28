//
//  PhotoPickerViewModel.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/15/23.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
final class MultiplePhotoPickerViewModel: ObservableObject {
    @Published private(set) var photos: [HashableImage] = []
    @Published var imageSelections: [PhotosPickerItem] = [] {
        didSet {
            self.loadTransferable(from: imageSelections)
        }
    }
    
    // Learned the use of loadTransferable here: https://developer.apple.com/documentation/photokit/photospicker
    func loadTransferable(from imageSelections: [PhotosPickerItem]) {
        for imageSelection in imageSelections {
            imageSelection.loadTransferable(type: Image.self) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image?):
                        self.photos.append(HashableImage(image: image))
                        // Handle the success case with the image.
                    case .success(nil):
                        print("Photo was nil.")
                        // Handle the success case with an empty value.
                    case .failure(let error):
                        print(error)
                        // Handle the failure case with the provided error.
                    }
                }
            }
        }
    }
}
