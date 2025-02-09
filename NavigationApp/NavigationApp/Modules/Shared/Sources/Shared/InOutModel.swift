//
//  InOutModel.swift
//  Shared
//
//  Created by Gerardo Grisolini on 06/02/25.
//

import NavigationKit

public final class InOutModel: InOutProtocol {
    public let value: String

    public init(value: String = "") {
        self.value = value
    }
}
