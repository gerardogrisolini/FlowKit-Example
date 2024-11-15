//
//  UIKitFlow.swift
//  FlowUIKit
//
//  Created by Gerardo Grisolini on 10/11/24.
//

import FlowShared

@Flow(InOutEmpty.self, route: Routes.uiKit(InOutModel()))
public final class UIKitFlow: FlowProtocol {
    public let node = UIKitView1.node {
        $0.page2 ~ UIKitView2.node {
            $0.page3 ~ UIKitView3.node
        }
    }
}

