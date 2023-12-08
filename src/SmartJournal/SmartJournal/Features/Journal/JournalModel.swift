//
//  JournalModel.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 12/8/23.
//

import Foundation
import SwiftUI
//import Firebase
//import FirebaseStorage

final class JournalModel {
    @Published var id: UUID
    @Published var owner: String
    @Published var isPublic: Bool
    @Published var title: String
    @Published var body: String
    @Published var photos: [UIImage]
    
    required init (owner: String, isPublic: Bool, title: String, body: String, photos: [UIImage]) {
        id = UUID()
        self.isPublic = isPublic
        self.owner = owner
        self.title = title
        self.body = body
        self.photos = photos
    }
}
