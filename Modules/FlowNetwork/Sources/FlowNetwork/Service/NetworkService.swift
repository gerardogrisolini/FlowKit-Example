//
//  NetworkService.swift
//
//
//  Created by Gerardo Grisolini on 16/12/23.
//

import Foundation
import FlowKit

public protocol NetworkServiceProtocol {
    func getUserInfo() async throws -> UserInfoModel
    func updateUserInfo(date: Date) async throws
}

public class NetworkService: NetworkServiceProtocol {
    @LazyInjected var flowNetwork: FlowNetworkProtocol

    public init() { }

    public func getUserInfo() async throws -> UserInfoModel {
        let dto = try await flowNetwork.exampleRepository.getUserInfo()
        return UserInfoModel(from: dto)
    }

    public func updateUserInfo(date: Date) async throws {
        try await flowNetwork.exampleRepository.updateUserInfo(date: date)
    }
}
