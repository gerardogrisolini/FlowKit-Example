//
//  UserInfoModel.swift
//  
//
//  Created by Gerardo Grisolini on 25/02/24.
//

import Foundation

public struct UserInfoModel {
    public let id: Int
    public let isAdmin: Bool
    public let date: Date
}

extension UserInfoModel {
    init(from dto: ExampleRepository.UserInfoDTO) {
        id = dto.id
        isAdmin = dto.isAdmin
        date = dto.date
    }
}
