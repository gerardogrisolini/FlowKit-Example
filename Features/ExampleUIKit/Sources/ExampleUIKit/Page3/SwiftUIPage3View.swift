//
//  SwiftUIPage3View.swift
//
//
//  Created by Gerardo Grisolini on 05/08/23.
//

import SwiftUI
import FlowShared

@FlowView(InOutEmpty.self)
struct SwiftUIPage3View: View, FlowViewProtocol {
    enum Out: FlowOutProtocol {
        case shared
    }

    var body: some View {
        Button(ExampleUIKitKeys.page5.localized) {
            out(.shared)
        }
        .navigationBarTitle(ExampleUIKitKeys.page3.localized)
    }
}

#Preview {
    SwiftUIPage3View()
}
