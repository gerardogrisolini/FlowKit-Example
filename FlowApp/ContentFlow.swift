//
//  ContentFlow.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 07/10/24.
//

import FlowShared

@Flow(InOutEmpty.self, route: Routes.home)
public final class ContentFlow: FlowProtocol {
    public let node = ContentView.node {
        $0.example ~ Routes.example
        $0.exampleUIKit ~ Routes.exampleUIKit
    }
}
