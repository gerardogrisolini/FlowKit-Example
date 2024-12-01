//
//  FlowNetwork.swift
//  FlowNetwork
//
//  Created by Gerardo Grisolini on 01/12/24.
//

import FlowShared

private struct NetworkServiceKey: @preconcurrency InjectionKey {
    @MainActor static var currentValue: NetworkServiceProtocol = NetworkService()
}

public extension InjectedValues {
    var network: NetworkServiceProtocol {
        get { Self[NetworkServiceKey.self] }
        set { Self[NetworkServiceKey.self] = newValue }
    }
}
