//
//  Module3View.swift
//  Module3
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import SwiftUI
import Shared

public struct Module3View: View {
    @Injected(\.router) var router

    let model: InOutModel
    public init(model: InOutModel) {
        self.model = model
    }

    public var body: some View {
        VStack(spacing: 32) {
            Text(model.value).font(.headline)
            Button("One") {
                try? router.navigate(route: Routes.Module3.one)
            }
        }
        .navigationTitle("Module 3")
    }
}

#Preview {
    Module3View(model: InOutModel(value: "Hello from preview"))
        .navigationKit()
}
