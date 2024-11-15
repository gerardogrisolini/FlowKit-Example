//
//  SwiftUIView1.swift
//  FlowSwiftUI
//
//  Created by Gerardo Grisolini on 10/11/24.
//

import SwiftUI
import FlowShared

@FlowView(InOutModel.self)
public struct SwiftUIView1: View, FlowViewProtocol {
    public enum Out: FlowOutProtocol {
        case page2
    }

    public var body: some View {
        VStack(spacing: 20) {
            Button(FlowSharedKeys.page2.localized) {
                out(.page2)
            }
            .buttonStyle(.plain)
            Text(model.info)
        }
        .navigationTitle(FlowSharedKeys.page1.localized)
        .backgroundShared()
    }
}

#Preview(traits: .navEmbedded) {
    SwiftUIView1()
}
