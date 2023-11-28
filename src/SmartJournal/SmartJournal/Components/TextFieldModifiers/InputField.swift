//
//  InputField.swift
//  SmartJournal
//
//  Created by Zach Veenstra on 11/10/23.
//

import Foundation
import SwiftUI

struct InputField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.textField)
            .foregroundColor(.black)
            .cornerRadius(10)
    }
}
