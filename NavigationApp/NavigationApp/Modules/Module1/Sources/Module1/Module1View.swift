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
            Button("Reload") {
                Task {
                    await loadData()
                }
            }
        }
        .navigationTitle("Module 1")
        .task {
            await loadData()
        }
    }

    private func loadData() async {
        router.present(.loader(style: .circle))
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        router.dismiss()
    }
}

#Preview {
    Module1View().navigationKit()
}
