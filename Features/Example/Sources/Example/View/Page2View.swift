//
//  Page2View.swift
//
//
//  Created by Gerardo Grisolini on 03/02/23.
//

import SwiftUI
import FlowNetwork
import FlowShared
extension Date: @retroactive Identifiable {}
extension Date: @retroactive InOutProtocol { }

@FlowView(InOutModel.self, init: false)
struct Page2View: FlowViewProtocol, View {
    @FlowCases
    enum Out: FlowOutProtocol {
        case page3(InOutModel)
        case page4(InOutModel)
        case uikit(InOutEmpty)
    }
    @FlowCases
    enum Event: FlowEventProtocol {
        case update(Date)
    }

    let exampleService: ExampleServiceProtocol

    @State var data: InOutModel

    init(model: InOutModel = InOutModel()) {
        self.model = model
        self._data = State(initialValue: model)
        self.exampleService = NetworkService()
    }

    init(model: InOutModel, service: ExampleServiceProtocol) {
        self.model = model
        self._data = State(initialValue: model)
        self.exampleService = service
    }

    var body: some View {
        VStack(spacing: 8) {
            Text(String(model.time))
                .font(.headline)

            Button(ExampleKeys.update) {
                event(.update(Date()))
            }

            Button(ExampleKeys.page3) {
                out(.page3(model))
            }

            Button(ExampleKeys.page4) {
                out(.page4(model))
            }

            Button("UIKit") {
                out(.uikit(InOutEmpty()))
            }
        }
        .task {
            await loadData()
        }
        .navigationBarTitle(ExampleKeys.page2, largeMode: true)
    }

    func onEventChanged(event: Event, model: some InOutProtocol) async {
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
