//
//  DarkToggleStyle.swift
//  Tortoise
//
//  Created by Gerardo Grisolini on 15/05/2020.
//

import SwiftUI

public struct DarkToggleStyle: ToggleStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            DarkBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}
