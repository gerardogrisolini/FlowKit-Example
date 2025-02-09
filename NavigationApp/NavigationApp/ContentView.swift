//
//  ContentView.swift
//  NavigationApp
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import SwiftUI
import Shared

struct ContentView: View {
    @Injected(\.router) var router

    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, NavigationKit!")

            Button("Module 1") {
                try? router.navigate(route: Routes.module1)
            }
            Button("Module 2") {
                try? router.navigate(route: Routes.module2)
            }
            Button("Module 3") {
                let param = InOutModel(value: "Hello from Home!")
                try? router.navigate(route: Routes.module3(param))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView().navigationKit()
}
