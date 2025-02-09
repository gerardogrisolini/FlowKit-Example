//
//  UserInfoModel.swift
//  
//
//  Created by Gerardo Grisolini on 25/02/24.
//

import Foundation

public struct UserInfoModel: Sendable {
    public let id: Int
    public let isAdmin: Bool
    public let date: Date
    public init(id: Int, isAdmin: Bool, date: Date) {
        self.id = id
        self.isAdmin = isAdmin
        self.date = date
    }
}

extension UserInfoModel {
    init(from dto: NetworkRepository.UserInfoDTO) {
        id = dto.id
        isAdmin = dto.isAdmin
        date = dto.date
    }
}
