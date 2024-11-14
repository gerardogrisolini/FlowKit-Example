//
//  UIKitFlowKeys.swift
//  FlowUIKit
//
//  Created by Gerardo Grisolini on 12/11/24.
//

import Foundation
import FlowKit

public enum ExampleUIKitKeys: String, Localizable {
    case page1, page2, page3

    public var localized: String {
        String(localized: injectedLocalized, bundle: .module)
    }
}
