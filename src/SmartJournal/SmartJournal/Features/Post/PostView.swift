//
//  PostView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct PostView: View, Hashable {
    let id = UUID()
    private let profileImage = Image(systemName: "person.circle")
    private let userName = Text("John Doe")
    private let images = [HashableImage(image: Image(systemName: "photo")), HashableImage(image: Image(systemName: "photo"))]
    private let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id neque vitae nunc porttitor facilisis. Vestibulum ac bibendum nibh, eget interdum leo. Aliquam ut nisl in sem vulputate tincidunt. Pellentesque sit amet neque diam. Duis ex lectus, accumsan eget eros eget, congue venenatis lacus. Praesent posuere placerat quam."
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                userName
            }
            
            ImageCarousel(photos: images)
                .frame(height: 200)
                
            
            Text(text)
        }
        .padding(10)
    }
}

#Preview {
    PostView()
}
