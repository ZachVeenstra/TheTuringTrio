//
//  PostView.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/6/23.
//

import SwiftUI

struct PostView: View, Hashable {
    
    private var viewModel = PostViewModel()
    let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: PostView, rhs: PostView) -> Bool {
        lhs.id == rhs.id
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                viewModel.profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                viewModel.userName
            }
            
            ImageCarousel(photos: viewModel.images)
                .frame(height: 200)
            
            Text(viewModel.text)
        }
        .padding(10)
    }
}

#Preview {
    PostView()
}
