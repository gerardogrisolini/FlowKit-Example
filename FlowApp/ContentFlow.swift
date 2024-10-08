//
//  ContentFlow.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 07/10/24.
//

import FlowShared

public class ContentFlow: FlowProtocol {
    public static let route: Routes = .home
    public var model = InOutEmpty()

    public let node = ContentView.node {
        $0.example(InOutModel()) ~ Routes.example
        $0.exampleUIKit ~ Routes.exampleUIKit
    }

    required public init() { }
}
