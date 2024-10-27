//
//  ExampleService.swift
//
//
//  Created by Gerardo Grisolini on 25/02/24.
//

import Foundation
import FlowNetwork

protocol ExampleServiceProtocol: Sendable {
    func getUserInfo() async throws -> UserInfoModel
    func updateUserInfo(date: Date) async throws
}

extension NetworkService: ExampleServiceProtocol { }
