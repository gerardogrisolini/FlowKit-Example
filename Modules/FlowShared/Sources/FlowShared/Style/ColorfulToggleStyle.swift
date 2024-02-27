//
//  ColorfulToggleStyle.swift
//  Tortoise
//
//  Created by Gerardo Grisolini on 15/05/2020.
//

import SwiftUI

public struct ColorfulToggleStyle: ToggleStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}
