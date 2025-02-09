//
//  InOutModel.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 15/11/24.
//

import FlowKit

public final class InOutModel: InOutProtocol {
    public let info: String
    public init(info: String = "") {
        self.info = info
    }
}
