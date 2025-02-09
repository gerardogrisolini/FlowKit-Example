//
//  Module1View.swift
//  Module1
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import SwiftUI
import Shared

public struct Module1View: View {
    @Injected(\.router) var router

    public init() {}
    public var body: some View {
        VStack(spacing: 32) {
            Button("Module 3") {
                let param = InOutModel(value: "Hello from Module1!")
                try? router.navigate(route: Routes.module3(param))
            }
        }
        .navigationTitle("Module 1")
    }
}

#Preview {
    Module1View()
}
