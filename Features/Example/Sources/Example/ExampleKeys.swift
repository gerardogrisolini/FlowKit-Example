//
//  ExampleKeys.swift
//
//
//  Created by Gerardo Grisolini on 28/01/24.
//

import FlowKit

enum ExampleKeys: String, Localizable {
    case page1, page2, page3, page4, page5, update

    var localized: String {
        String(localized: injectedLocalized, bundle: .module)
    }
}
