//
//  ExampleUIKitFlow.swift
//
//
//  Created by Gerardo Grisolini on 31/08/23.
//

import FlowShared

public class ExampleUIKitFlow: FlowProtocol {
    public static let route: Routes = .exampleUIKit
    public var model = InOutEmpty()
    
    public let node = UIKitPage1View.node {
        $0.uikit ~ UIKitPage2View.node {
            $0.page4 ~ UIKitPage4View.node
        }
        $0.swiftui ~ SwiftUIPage3View.node {
            $0.shared ~ Page5View.node
        }
    }

    required public init() { }
}
