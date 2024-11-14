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

    private var context: ModelContainer { Resolver.resolve() }

    public let node = ContentView.node {
        $0.swiftUI ~ Routes.swiftUI
        $0.uiKit ~ Routes.uiKit
        $0.data ~ Routes.data
        $0.item ~ Routes.item
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
            return try await getData()
        }
    }

    @MainActor
    private func getData() throws -> ItemModel {
        var descriptor = FetchDescriptor<Item>(sortBy: [SortDescriptor(\Item.createdAt, order: .reverse)])
        descriptor.fetchLimit = 1
        guard let item = try context.mainContext.fetch(descriptor).first else {
            throw FlowError.generic
        }
        return ItemModel(from: item)
    }
}
