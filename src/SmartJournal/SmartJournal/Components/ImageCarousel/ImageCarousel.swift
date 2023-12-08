//
//  SwiftUIView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct ImageCarousel: View {
    var photos: [UIImage] = [UIImage(systemName: "photo")!, UIImage(systemName: "photo")!, UIImage(systemName: "photo")!]
    
    var body: some View {
            TabView {
                ForEach(Array(zip(photos.indices, photos)), id: \.0) { _, photo in
                    Image(uiImage: photo)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }
            }
            .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    ImageCarousel()
}
