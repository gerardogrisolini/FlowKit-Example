//
//  ExampleRepository.swift
//
//
//  Created by Gerardo Grisolini on 25/02/24.
//

import Foundation

public protocol ExampleRepositoryProtocol {
    func getUserInfo() async throws -> ExampleRepository.UserInfoDTO
    func updateUserInfo(date: Date) async throws
}

public class ExampleRepository: ExampleRepositoryProtocol {
    private var date = Date()

    public func getUserInfo() async throws -> UserInfoDTO {
        UserInfoDTO(id: 1, isAdmin: true, date: date)

    }

    public func updateUserInfo(date: Date) async throws {
        self.date = date
    }
}
