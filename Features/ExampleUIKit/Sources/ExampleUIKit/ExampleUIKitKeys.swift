//
//  ExampleUIKitKeys.swift
//
//
//  Created by Gerardo Grisolini on 22/02/24.
//

import Foundation
import FlowKit

public enum ExampleUIKitKeys: String, Localizable {
    case page1, page2, page3, page4, page5

    public var localized: String {
        String(localized: injectedLocalized, bundle: .module)
    }
}
