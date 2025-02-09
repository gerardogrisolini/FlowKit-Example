//
//  DataListView.swift
//  FlowData
//
//  Created by Gerardo Grisolini on 21/09/24.
//

import SwiftUI
import SwiftData
import FlowShared

@FlowView(InOutEmpty.self)
public struct DataListView: View, FlowViewProtocol {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.createdAt) private var items: [Item]
    @State private var searchText: String = ""

    private var filtered: [Item] {
        guard searchText.isEmpty == false else { return items }
        return items.filter { $0.name.contains(searchText)}
    }

    @FlowCases
    public enum Out: FlowOutProtocol {
        case detail(ItemModel)
    }

    public var body: some View {
        List {
            ForEach(filtered) { item in
                Button {
                    let model = ItemModel(from: item)
                    out(.detail(model))
                } label: {
                    VStackLayout(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        HStackLayout {
                            Text(item.serialNumber)
                            Spacer()
                            Text(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))
                        }
                        .font(.subheadline)
                    }
                }
                .buttonStyle(.plain)
            }
            .onDelete(perform: deleteItems)
            .listRowBackground(Color.white.opacity(0.4))
        }
        .searchable(text: $searchText)
        .listStyle(.plain)
        .autocorrectionDisabled()
        .scrollContentBackground(.hidden)
        .overlay {
            if items.isEmpty {
                ContentUnavailableView.search(text: searchText)
            }
        }
        .toolbar {
#if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
#endif
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .backgroundShared()
        .navigationTitle("Items")
        .edgesIgnoringSafeArea(.bottom)
   }

    private func addItem() {
        let count = items.count + 1
        let model = ItemModel(name: "Item \(count)", serialNumber: "0000-0000-0000-0000", createdAt: .init())
        out(.detail(model))
    }

    private func deleteItems(offsets: IndexSet) {
        let itemActor = ItemActor(modelContainer: modelContext.container)
        Task { @MainActor in
            for index in offsets {
                try await itemActor.delete(items[index].id)
            }
        }
    }
}

#Preview(traits: .navEmbedded, .mockData) {
    DataListView()
}
