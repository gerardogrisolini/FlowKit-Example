//
//  DarkButtonStyle.swift
//  Tortoise
//
//  Created by Gerardo Grisolini on 15/05/2020.
//

import SwiftUI

public struct DarkButtonStyle: ButtonStyle {
    public init() { }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
            .animation(nil)
    }
}
