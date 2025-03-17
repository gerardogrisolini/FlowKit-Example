//
//  NetworkRepository.swift
//
//
//  Created by Gerardo Grisolini on 25/02/24.
//

import Foundation

public protocol NetworkRepositoryProtocol {
    func getUserInfo() async throws -> NetworkRepository.UserInfoDTO
}

public class NetworkRepository: NetworkRepositoryProtocol {
    public func getUserInfo() async throws -> UserInfoDTO {
        try await Task.sleep(nanoseconds: 3_000_000_000)
        return UserInfoDTO(id: 1, isAdmin: true, date: Date())
    }
}
