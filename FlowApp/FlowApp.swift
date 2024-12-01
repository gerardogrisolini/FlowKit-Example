//
//  FlowApp.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 28/10/24.
//

import SwiftUI
import SwiftData
import FlowShared
import FlowNetwork

@main
struct FlowApp: App {
    @Injected(\.modelContainer) var modelContainer

    init () {
        FlowKit.initialize()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .join(flow: AppFlow())
         }
        .modelContainer(modelContainer)
    }
}
