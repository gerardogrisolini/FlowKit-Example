//
//  Routes.swift
//  Shared
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import NavigationKit

@FlowCases
public enum Routes: Routable {
    case module1
    case module2
    case module3(InOutModel)
}
