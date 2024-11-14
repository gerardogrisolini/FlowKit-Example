//
//  AppFlow.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 28/10/24.
//

import Foundation
import SwiftData
import FlowKit
import FlowShared

@Flow(InOutEmpty.self, route: Routes.home)
public final class AppFlow: FlowProtocol {

    @MainActor private var context: ModelContainer { Resolver.resolve() }

    public let node = ContentView.node {
        $0.swiftUI ~ Routes.swiftUI
        $0.uiKit ~ Routes.uiKit
        $0.data ~ Routes.data
    }

    public var behavior: FlowBehavior {
        .init {
            Events {
                ContentView.Event.fetch ~ onEvent
            }
        }
    }

    private func onEvent(_ event: any FlowEventProtocol) async throws -> any InOutProtocol {
        switch event as! ContentView.Event {
        case .fetch:
            let itemActor = await ItemActor(modelContainer: context)
            guard let item = try await itemActor.fetchData().last else {
                throw FlowError.generic
            }
            return item
        }
    }
}
