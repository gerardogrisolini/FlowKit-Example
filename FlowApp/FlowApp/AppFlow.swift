//
//  AppFlow.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 28/10/24.
//

import SwiftData
import FlowShared

@Flow(InOutEmpty.self, route: Routes.home)
public final class AppFlow: FlowProtocol {

    public let node = ContentView.node {
        $0.swiftUI ~ Routes.swiftUI
        $0.uiKit ~ Routes.uiKit
        $0.data ~ Routes.data
    }

    private let modelContainer: ModelContainer

    public init() {
        modelContainer = InjectedValues[\.modelContainer]
    }

    public func runEvent(_ event: any FlowEventProtocol) async throws -> any InOutProtocol {
        switch event as! ContentView.Event {
        case .fetch:
            let itemActor = ItemActor(modelContainer: modelContainer)
            guard let item = try await itemActor.fetchData().last else {
                throw FlowError.generic
            }
            return item
        }
    }
}
