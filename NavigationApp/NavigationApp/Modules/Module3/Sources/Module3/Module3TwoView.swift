//
//  Module3TwoView.swift
//  Module3
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import SwiftUI
import Shared

struct Module3TwoView: View {
    @Injected(\.router) var router

    let model: InOutModel
    init(model: InOutModel = .init()) {
        self.model = model
    }

    var body: some View {
        VStack(spacing: 32) {
            Text(model.value).font(.headline)
            Button("PopToRoot") {
                router.popToRoot()
            }
        }
        .navigationTitle("Module3 - Two")
    }
}

#Preview {
    Module3TwoView()
}
