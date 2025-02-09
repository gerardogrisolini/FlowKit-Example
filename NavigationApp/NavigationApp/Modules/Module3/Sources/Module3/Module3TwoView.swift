//
//  Module3TwoView.swift
//  Module3
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import SwiftUI
import Shared

public struct Module3TwoView: View {
    @Injected(\.router) var router

    public var body: some View {
        VStack(spacing: 32) {
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
