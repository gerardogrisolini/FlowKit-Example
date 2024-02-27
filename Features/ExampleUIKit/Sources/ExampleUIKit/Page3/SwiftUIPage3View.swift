//
//  SwiftUIPage3View.swift
//
//
//  Created by Gerardo Grisolini on 05/08/23.
//

import SwiftUI
import FlowShared

struct SwiftUIPage3View: View, FlowViewProtocol {
    enum Out: FlowOutProtocol {
        case shared
    }

    let model: InOutEmpty
    init(model: InOutEmpty = InOutEmpty()) {
        self.model = model
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
