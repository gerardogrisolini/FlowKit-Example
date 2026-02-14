//
//  FlowNetwork.swift
//  FlowNetwork
//
//  Created by Gerardo Grisolini on 01/12/24.
//

import FlowShared

private struct NetworkServiceProvider: @preconcurrency InjectionProvider {
    @MainActor static var currentValue: NetworkServiceProtocol = NetworkService()
}

public extension InjectedValues {
    @MainActor
    var network: NetworkServiceProtocol {
        get { Self[NetworkServiceProvider.self] }
        set { Self[NetworkServiceProvider.self] = newValue }
    }
}
