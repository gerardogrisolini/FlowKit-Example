//
//  Module3OneView.swift
//  Module3
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import SwiftUI
import Shared

public struct Module3OneView: View {
    @Injected(\.router) var router

    public var body: some View {
        VStack(spacing: 32) {
            Button("Two") {
                try? router.navigate(route: Module3Routes.two)
            }
        }
        .navigationTitle("Module3 - One")
    }
}

#Preview {
    Module3OneView()
}
