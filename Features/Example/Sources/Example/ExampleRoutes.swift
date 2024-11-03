//
//  ExampleRoutes.swift
//  
//
//  Created by Gerardo Grisolini on 18/02/24.
//

import FlowShared

@FlowCases
public enum ExampleRoutes: Routable  {
    case example(InOutModel)
    case exampleLite
    case exampleCustom
}
