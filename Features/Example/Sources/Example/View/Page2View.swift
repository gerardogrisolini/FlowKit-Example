//
//  Page2View.swift
//
//
//  Created by Gerardo Grisolini on 03/02/23.
//

import SwiftUI
import FlowNetwork
import FlowShared

struct Page2View: FlowViewProtocol, View {
    enum Out: FlowOutProtocol {
        case page3, page4
    }
    enum Event: FlowEventProtocol {
        case update(Date)
    }

    var exampleService: ExampleServiceProtocol = NetworkService()

    @State var model: InOutModel

    init(model: InOutModel = InOutModel()) {
        self._model = State(initialValue: model)
    }

    var body: some View {
        VStack(spacing: 8) {
            Text(String(model.time))
                .font(.headline)

            Button(ExampleKeys.update) {
                event(.update(Date()))
            }

            Button(ExampleKeys.page3) {
                out(.page3)
            }

            Button(ExampleKeys.page4) {
                out(.page4)
            }
        }
        .task {
            await loadData()
        }
        .navigationBarTitle(ExampleKeys.page2, largeMode: true)
    }

    func onEventChanged(_ event: Event, _ model: (any InOutProtocol)?) async {
        switch event {
        case .update(let date):
            await updateData(date: date)
        }
    }

    private func loadData() async {
        guard let user = try? await exampleService.getUserInfo() else { return }
        model.time = user.date.description
    }

    private func updateData(date: Date) async {
        try? await exampleService.updateUserInfo(date: date)
        await loadData()
    }
}

#Preview {
    NavigationView {
        Page2View().preview()
    }
}
