//
//  ContentView.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 28/10/24.
//

import SwiftUI
import SwiftData
import FlowShared

@FlowView(InOutEmpty.self)
public struct ContentView: View, FlowViewProtocol {

    @FlowCases
    public enum Out: FlowOutProtocol {
        case swiftUI(InOutModel)
        case uiKit(InOutModel)
        case data
    }

    public enum Event: FlowEventProtocol {
        case fetch
    }

    @Bindable var viewModel = ContentViewModel()

    public var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedTab) {
                Tab(TabbedItems.swiftUI.title, systemImage: TabbedItems.swiftUI.iconName, value: TabbedItems.swiftUI) {
                    SwiftUIWidget()
                        .widget(on: self)
                }
                Tab(TabbedItems.uiKit.title, systemImage: TabbedItems.uiKit.iconName, value: TabbedItems.uiKit) {
                    UIKitWidget()
                        .widget(on: self)
                }
                Tab(TabbedItems.data.title, systemImage: TabbedItems.data.iconName, value: TabbedItems.data) {
                    DataWidget(model: $viewModel.item)
                        .widget(on: self)
                }
            }
            .tabViewStyle(.tabBarOnly)
        }
        .navigationTitle("FlowApp")
    }

    public func onEventChanged(event: Event, model: some InOutProtocol) async {
        print("onEventChanged: \(event) -> \(model)")
        guard case .fetch = event, let m = model as? ItemModel else { return }
        viewModel.item = m
    }

    public func onCommit(model: some InOutProtocol) async {
        print("onCommit: \((model as? InOutModel)?.info ?? "")")
    }
}

@Observable
class ContentViewModel {
    var selectedTab: TabbedItems = .swiftUI
    var item: ItemModel = .init()
}

#Preview(traits: .navEmbedded) {
    ContentView()
        .preview()
}
