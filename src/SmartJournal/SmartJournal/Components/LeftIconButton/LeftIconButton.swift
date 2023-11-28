//
//  LeftIconButton.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/15/23.
//

import SwiftUI

struct LeftIconButton: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
            Text("userName")
                .font(.largeTitle)
        }
    }
}

#Preview {
    LeftIconButton()
}
