//
//  PostViewModel.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 12/6/23.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    @Published var profileImage = Image(systemName: "person.circle")
    @Published var userName = Text("John Doe")
    @Published var images = [HashableImage(image: Image(systemName: "photo")), HashableImage(image: Image(systemName: "photo"))]
    @Published var text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id neque vitae nunc porttitor facilisis. Vestibulum ac bibendum nibh, eget interdum leo. Aliquam ut nisl in sem vulputate tincidunt. Pellentesque sit amet neque diam. Duis ex lectus, accumsan eget eros eget, congue venenatis lacus. Praesent posuere placerat quam."
    
}
