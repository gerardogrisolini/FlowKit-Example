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
        case swiftUI
        case uiKit
        case data
    }

    public enum Event: FlowEventProtocol {
        case fetch
    }

    @Bindable var viewModel = ContentViewModel()

    public var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedTab) {
                SwiftUIWidget()
                    .widget(on: self)
                    .tag(TabbedItems.swiftUI)
                UIKitWidget()
                    .widget(on: self)
                    .tag(TabbedItems.uiKit)
                DataWidget(model: $viewModel.item)
                    .widget(on: self)
                    .tag(TabbedItems.data)
            }
            .tabViewStyle(.tabBarOnly)

            ZStack {
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            viewModel.selectedTab = item
                        } label: {
                            TabItem(title: item.title, imageName: item.iconName, isActive: (viewModel.selectedTab == item))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(6)
            }
            .frame(height: 60)
            .background(.green.opacity(0.2))
            .cornerRadius(30)
        }
        .navigationTitle("FlowApp")
    }

    public func onEventChanged(event: Event, model: some InOutProtocol) async {
        print("onEventChanged: \(event) -> \(model)")
        guard case .fetch = event, let m = model as? ItemModel else { return }
        viewModel.item = m
    }

    public func onCommit(model: some InOutProtocol) async {
        print("onCommit: \(model)")
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
