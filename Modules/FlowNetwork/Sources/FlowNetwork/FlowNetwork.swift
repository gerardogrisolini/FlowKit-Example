//
//  FlowNetwork.swift
//
//
//  Created by Gerardo Grisolini on 16/12/23.
//

public protocol FlowNetworkProtocol {
    var networkService: NetworkServiceProtocol { get }
}

public class FlowNetwork: FlowNetworkProtocol {
    public lazy var networkService: NetworkServiceProtocol = NetworkService()
    public init() { }
}
