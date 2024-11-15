//
//  Item.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 01/10/24.
//

import Foundation
import SwiftData
import FlowKit

@Model
public final class Item {
    @Attribute(.unique)
    public var id: UUID
    public var name: String
    public var serialNumber: String
    public var createdAt: Date

    public init() {
        self.id = UUID()
        self.name = ""
        self.serialNumber = ""
        self.createdAt = Date.distantPast
    }

    public init(id: UUID = UUID(), name: String, serialNumber: String, createdAt: Date) {
        self.id = id
        self.name = name
        self.serialNumber = serialNumber
        self.createdAt = createdAt
    }
}

public final class ItemModel: InOutProtocol {
    public let id: UUID
    public let name: String
    public let serialNumber: String
    public let createdAt: Date

    public init() {
        self.id = UUID()
        self.name = ""
        self.serialNumber = ""
        self.createdAt = Date.distantPast
    }

    public init(id: UUID = UUID(), name: String, serialNumber: String, createdAt: Date) {
        self.id = id
        self.name = name
        self.serialNumber = serialNumber
        self.createdAt = createdAt
    }
}

public extension Item {
    convenience init (from model: ItemModel) {
        self.init(id: model.id, name: model.name, serialNumber: model.serialNumber, createdAt: model.createdAt)
    }
}

public extension ItemModel {
    convenience init (from model: Item) {
        self.init(id: model.id, name: model.name, serialNumber: model.serialNumber, createdAt: model.createdAt)
    }
}

@ModelActor
public actor ItemActor {
    private var context: ModelContext { modelExecutor.modelContext }

    public func insert(_ model: ItemModel) async {
        let item = Item(from: model)
        context.insert(item)
    }

    public func updateOrInsert(_ model: ItemModel) async {
        guard let item = get(id: model.id) else {
            return await insert(model)
        }
        item.name = model.name
        item.serialNumber = model.serialNumber
        item.createdAt = model.createdAt
    }

    public func delete(_ id: UUID) async throws {
        let predicate = #Predicate<Item> { object in
            object.id == id
        }
        try context.delete(model: Item.self, where: predicate)
    }

    public func save() async throws {
        try context.save()
    }

    public func fetchData() async throws -> [ItemModel] {
        let fetchDescriptor = FetchDescriptor<Item>(sortBy: [SortDescriptor(\Item.createdAt)])
        let users: [Item] = try context.fetch(fetchDescriptor)
        let userDTOs = users.map { ItemModel(from: $0)}
        return userDTOs
    }

    public func get(id: UUID) -> Item? {
        do {
            let predicate = #Predicate<Item> { object in
                object.id == id
            }
            var descriptor = FetchDescriptor<Item>(predicate: predicate)
            descriptor.fetchLimit = 1
            return try context.fetch(descriptor).first
        } catch {
            return nil
        }
    }
}
