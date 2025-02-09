//
//  Module3Routes.swift
//  Module3
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import NavigationKit

enum Module3Routes: Routable {
    case one
    case two

    @MainActor var view: (any Sendable)? {
        switch self {
        case .one:
            return Module3OneView()
        case .two:
            return Module3TwoView()
        }
    }
}
