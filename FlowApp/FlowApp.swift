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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    init () {
        FlowKit.initialize()
        FlowKit.register(scope: .application) { [sharedModelContainer] in
            sharedModelContainer as ModelContainer
        }
        FlowKit.register(scope: .graph) {
            FlowNetwork() as FlowNetworkProtocol
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .join(flow: AppFlow())
         }
        .modelContainer(sharedModelContainer)
    }
}
