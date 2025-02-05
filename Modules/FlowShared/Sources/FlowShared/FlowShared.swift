//
//  FlowShared.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 18/09/24.
//

@_exported import FlowKit
import SwiftData

private struct ModelContainerProvider: @preconcurrency InjectionProvider {

    static let modelContainer: ModelContainer = {
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

    @MainActor static var currentValue = modelContainer
}

public extension InjectedValues {

    var modelContainer: ModelContainer {
        get { Self[ModelContainerProvider.self] }
        set { Self[ModelContainerProvider.self] = newValue }
    }
}
