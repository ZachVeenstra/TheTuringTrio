//
//  CustomText.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/9/23.
//

import SwiftUI

struct CustomTextView: View {
    var text: String
    var labelText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(labelText)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 4)

            ZStack(alignment: .topLeading) {
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    .padding()
                    .accentColor(.black)
                    .background(Color.textField)
                    .border(Color.textField)
                    .cornerRadius(10)
            }
        }
        .padding(.bottom)
    }
}
