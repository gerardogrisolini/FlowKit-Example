//
//  Routes.swift
//  Shared
//
//  Created by Gerardo Grisolini on 18/09/24.
//

import FlowKit

@FlowCases
public enum Routes: Routable  {
    case home
    case swiftUI(InOutModel)
    case uiKit(InOutModel)
    case data
}
