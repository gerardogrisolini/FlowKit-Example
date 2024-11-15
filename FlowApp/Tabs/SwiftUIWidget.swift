//
//  SwiftUIWidget.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 05/10/24.
//

import SwiftUI
import FlowShared

struct SwiftUIWidget: View, FlowWidgetProtocol {
    @Environment(\.parent) var parent

    @FlowCases
    enum Out: FlowOutProtocol {
        case swiftUI(InOutModel)
    }

    var body: some View {
        VStack(spacing: 20) {
            Button("SwiftUI") {
                let model = InOutModel(info: "SwiftUI")
                out(.swiftUI(model))
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color.white.cornerRadius(20).opacity(0.1))
        .backgroundShared()
    }
}

#Preview {
    SwiftUIWidget()
}
