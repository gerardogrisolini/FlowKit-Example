//
//  UserInfoDTO.swift
//  
//
//  Created by Gerardo Grisolini on 25/02/24.
//

import Foundation

extension ExampleRepository {
    public struct UserInfoDTO: Codable, Sendable {
        let id: Int
        let isAdmin: Bool
        let date: Date
    }
}
