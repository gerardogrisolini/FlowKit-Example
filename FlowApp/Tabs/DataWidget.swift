//
//  DataWidget.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 05/10/24.
//

import SwiftUI
import FlowShared

struct DataWidget: View, FlowWidgetProtocol {
    @Environment(\.parent) var parent

    @FlowCases
    public enum Out: FlowOutProtocol {
        case data
        case item(ItemModel)
    }
    public enum Event: FlowEventProtocol {
        case fetch
    }

    @Binding var model: ItemModel

    var body: some View {
        VStack(spacing: 20) {
            Button("Items") { out(.data) }
                .buttonStyle(.plain)
                .typesettingLanguage(.init(languageCode: .english))

            Button("Fetch last item") { event(.fetch) }.buttonStyle(.plain)
            Button {
                out(.item(model))
            } label: {
                Text(model.serialNumber)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color.white.cornerRadius(20).opacity(0.1))
        .backgroundShared()
    }
}

#Preview {
    @Previewable @State var model: ItemModel = .init()
    DataWidget(model: $model)
}
