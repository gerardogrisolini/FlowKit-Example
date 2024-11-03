//
//  ExampleUIKitFlow.swift
//
//
//  Created by Gerardo Grisolini on 31/08/23.
//

import FlowShared

@Flow(InOutEmpty.self, route: Routes.exampleUIKit)
public final class ExampleUIKitFlow: FlowProtocol {
    public let node = UIKitPage1View.node {
        $0.uikit ~ UIKitPage2View.node {
            $0.page4 ~ UIKitPage4View.node
        }
        $0.swiftui ~ SwiftUIPage3View.node {
            $0.shared ~ SwiftUIPage5View.node
        }
    }
}
