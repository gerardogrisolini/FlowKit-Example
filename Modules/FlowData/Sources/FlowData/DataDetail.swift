//
//  DataDetail.swift
//  FlowData
//
//  Created by Gerardo Grisolini on 27/09/24.
//

import SwiftUI
import FlowShared
import SwiftData

@FlowView(ItemModel.self, init: false)
public struct DataDetail: View, FlowViewProtocol {
    @Environment(\.modelContext) private var modelContext
    @Bindable var item: Item

    private var validation: Result<Void, ValidationError> {
        let regex = /([0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4})/
        guard item.serialNumber.wholeMatch(of: regex)?.output.0 != nil else {
            return .failure(.generic(message: "The value is not in the correct format."))
        }
        return .success
    }

    private var isValid: Bool {
        switch validation {
        case .success: return true
        case .failure: return false
        }
    }

    public init(model: ItemModel) {
        self.model = model
        self.item = Item(from: model)
    }

    public var body: some View {
        VStack {
            Form {
                DatePicker("Date", selection: $item.createdAt)
                    .padding(.vertical, 10)

                FlowTextField(title: "Name", text: $item.name)
                    .isMandatory()
                    .clearButton()
                    .autocorrectionDisabled()

                FlowTextField(title: "SerialNumber", text: $item.serialNumber)
                    .onValidate {
                        validation
                    }
                    .isMandatory()
                    .clearButton()
                    .autocorrectionDisabled()
            }
            .scrollContentBackground(.hidden)

            Spacer()

            Button("Save") {
                Task { try await save() }
            }
            .disabled(!isValid)
        }
        .navigationTitle("Item")
        .backgroundShared()
   }

    func save() async throws {
        let itemActor = ItemActor(modelContainer: modelContext.container)
        let model = ItemModel(from: item)
        await itemActor.updateOrInsert(model)
        try await itemActor.save()
        back()
    }
}

#Preview(traits: .navEmbedded, .mockData) {
    @Previewable @Query(sort: \Item.createdAt) var items: [Item]
    DataDetail(model: ItemModel(from: items[0]))
}

 
