//
//  SwiftUIView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct ImageCarousel: View {
    var photos: [HashableImage] = [HashableImage(), HashableImage(), HashableImage()]
    
    var body: some View {
            TabView {
                ForEach(photos, id: \.self) { photo in
                    photo.image
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
