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

    enum Out: FlowOutProtocol {
        case swiftUI
    }

    var body: some View {
        VStack(spacing: 20) {
            Button("SwiftUI") { out(.swiftUI) }.buttonStyle(.plain)
        }
        .padding()
        .background(Color.white.cornerRadius(20).opacity(0.1))
        .backgroundShared()
    }
}

#Preview {
    SwiftUIWidget()
}
