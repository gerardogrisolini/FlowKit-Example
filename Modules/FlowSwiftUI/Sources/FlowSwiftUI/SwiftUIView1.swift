//
//  SwiftUIView1.swift
//  FlowSwiftUI
//
//  Created by Gerardo Grisolini on 10/11/24.
//

import SwiftUI
import FlowShared

@FlowView(InOutEmpty.self)
public struct SwiftUIView1: View, FlowViewProtocol {
    public enum Out: FlowOutProtocol {
        case page2
    }

    public var body: some View {
        VStack {
            Button(FlowSharedKeys.page2.localized) {
                out(.page2)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color.white.cornerRadius(20).opacity(0.1))
        .navigationTitle(FlowSharedKeys.page1.localized)
        .backgroundShared()
    }
}

#Preview(traits: .navEmbedded) {
    SwiftUIView1()
}
