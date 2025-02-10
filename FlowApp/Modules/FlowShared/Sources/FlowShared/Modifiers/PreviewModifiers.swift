//
//  PreviewModifiers.swift
//  Shared
//
//  Created by Gerardo Grisolini on 29/09/24.
//

import SwiftUI
import SwiftData

public struct NavEmbedded: PreviewModifier {
    public func body(content: Content, context: Void) -> some View {
        content.navigationKit()
    }
}

public extension PreviewTrait where T == Preview.ViewTraits {
    static var navEmbedded: Self = .modifier(NavEmbedded())
}

public struct MockData: PreviewModifier {
    public func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }

    public static func makeSharedContext() async throws -> ModelContainer {
        let container = try! ModelContainer(
            for: Item.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        for i in 10..<30 {
            container.mainContext.insert(Item(name: "Item \(i)", serialNumber: "0000-0000-0000-00\(i)", createdAt: Date()))
        }

        return container
    }
}

public extension PreviewTrait where T == Preview.ViewTraits {
    static var mockData: Self = .modifier(MockData())
}

