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

            Button(FlowSharedKeys.fetch.localized) {
                Task { [viewModel] in
                    await viewModel.fetchData()
                }
            }
            .buttonStyle(.plain)

            if let date = viewModel.data?.date {
                Text(date.formatted(.iso8601))
            }
        }
        .navigationTitle(FlowSharedKeys.page2.localized)
        .backgroundShared()
        .task { [viewModel] in
            await viewModel.fetchData()
        }
    }
}

@MainActor
@Observable
final class SwiftUIViewModel {
    @ObservationIgnored let router: RouterProtocol
    @ObservationIgnored let service: NetworkServiceProtocol

    var data: UserInfoModel? = nil

    init(
        router: RouterProtocol = InjectedValues[\.router],
        service: NetworkServiceProtocol = InjectedValues[\.network]
    ) {
        self.router = router
        self.service = service
    }

    func fetchData() async {
        router.present(.loader(style: .circle))
        do {
            data = try await service.getUserInfo()
        } catch {
            await router.present(.toast(message: error.localizedDescription, style: .error))
        }
        router.dismiss()
    }
}

#Preview(traits: .navEmbedded) {
    SwiftUIView2()
}
