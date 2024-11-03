//
//  Routes.swift
//  
//
//  Created by Gerardo Grisolini on 29/01/23.
//

import FlowKit

@FlowCases
public enum Routes: Routable  {
    case home
    case example(InOutModel)
    case exampleLite
    case exampleUIKit
}
