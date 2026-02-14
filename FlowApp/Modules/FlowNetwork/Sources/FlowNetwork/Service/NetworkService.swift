//
//  NetworkService.swift
//
//
//  Created by Gerardo Grisolini on 16/12/23.
//

import Foundation

@MainActor
public protocol NetworkServiceProtocol {
    func getUserInfo() async throws -> UserInfoModel
}

@MainActor
public final class NetworkService: NetworkServiceProtocol {
    lazy var repository: NetworkRepositoryProtocol = NetworkRepository()

    public func getUserInfo() async throws -> UserInfoModel {
        let dto = try await repository.getUserInfo()
        return UserInfoModel(from: dto)
    }

    public init() { }
}
