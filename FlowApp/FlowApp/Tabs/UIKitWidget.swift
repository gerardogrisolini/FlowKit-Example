//
//  UIKitWidget.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 05/10/24.
//

import SwiftUI
import FlowShared

struct UIKitWidget: View, FlowWidgetProtocol {
    @Environment(\.parent) var parent

    @FlowCases
    enum Out: FlowOutProtocol {
        case uiKit(InOutModel)
    }

    var body: some View {
        VStack(spacing: 20) {
            Button("UIKit") {
                let model = InOutModel(info: "UIKit")
                out(.uiKit(model))
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color.white.cornerRadius(20).opacity(0.1))
        .backgroundShared()
    }
}

#Preview {
    UIKitWidget()
}
