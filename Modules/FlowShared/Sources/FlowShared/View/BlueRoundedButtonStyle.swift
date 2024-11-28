//
//  BlueRoundedButtonStyle.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 22/11/24.
//

import SwiftUI

struct BlueRoundedButtonStyle: ButtonStyle {
    func makeBody(
        configuration: Configuration
    ) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .padding(32)
            .background(
                configuration.isPressed ? .blue.opacity(0.5) : .blue
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                )
            )
    }
}
