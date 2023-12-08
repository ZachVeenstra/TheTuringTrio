//
//  ActionButton.swift
//  SmartJournal
//
//  Created by Usman Tahir Qureshi on 11/9/23.
//

import SwiftUI

struct ActionButton: ButtonStyle {
    private let cornerRadius: Double = 10
    private let pressedScale: Double = 1.2
    private let unpressedScale: Double = 1
    private let animationLength: Double = 0.17
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.actionButton)
            .foregroundColor(.white)
            .cornerRadius(cornerRadius)
            .scaleEffect(configuration.isPressed ? pressedScale : unpressedScale)
            .animation(.easeIn(duration: animationLength), value: configuration.isPressed)
    }
}
