//
//  SwiftUIView2.swift
//  FlowSwiftUI
//
//  Created by Gerardo Grisolini on 10/11/24.
//

import SwiftUI
import Observation
import FlowShared
import FlowNetwork

@FlowView(InOutEmpty.self)
struct SwiftUIView2: View, FlowViewProtocol {
    let viewModel = SwiftUIViewModel()

    enum Out: FlowOutProtocol {
        case page3
    }
    var body: some View {
        VStack(spacing: 20) {
            Button(FlowSharedKeys.page3.localized) {
                out(.page3)
            }
            .buttonStyle(.plain)

            Button(FlowSharedKeys.fetch.localized) {
                Task { [viewModel] in
                    try await viewModel.fetchData()
                }
            }
            .buttonStyle(.plain)
            if let date = viewModel.data?.date {
                Text(date.formatted(.iso8601))
            }
        }
        .navigationTitle(FlowSharedKeys.page2.localized)
        .backgroundShared()
    }
}

@Observable
final class SwiftUIViewModel {
    let network: FlowNetworkProtocol = Resolver.resolve()
    var data: UserInfoModel? = nil

    func fetchData() async throws {
        data = try await network.networkService.getUserInfo()
    }
}

#Preview(traits: .navEmbedded) {
    FlowKit.register(scope: .graph) {
        FlowNetwork() as FlowNetworkProtocol
    }
    return SwiftUIView2()
}
