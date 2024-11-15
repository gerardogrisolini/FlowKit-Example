//
//  SwiftUIFlow.swift
//  FlowSwiftUI
//
//  Created by Gerardo Grisolini on 10/11/24.
//

import FlowShared

@Flow(InOutModel.self, route: Routes.swiftUI(InOutModel()))
public final class SwiftUIFlow: FlowProtocol {

    public let node = SwiftUIView1.node {
        $0.page2 ~ SwiftUIView2.node {
            $0.page3 ~ SwiftUIView3.node
        }
    }
}

