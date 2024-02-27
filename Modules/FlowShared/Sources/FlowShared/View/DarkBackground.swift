//
//  DarkBackground.swift
//  Tortoise
//
//  Created by Gerardo Grisolini on 15/05/2020.
//

import SwiftUI

public struct DarkBackground<S: Shape>: View {
    public var isHighlighted: Bool
    public var shape: S

    public var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 2))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(Color.darkEnd, lineWidth: 2))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

extension Color {
    public static let offWhite = Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)

    public static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    public static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)

    public static let lightStart = Color(red: 160 / 255, green: 160 / 255, blue: 240 / 255)
    public static let lightEnd = Color(red: 130 / 255, green: 80 / 255, blue: 120 / 255)
}

extension LinearGradient {
    public init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
