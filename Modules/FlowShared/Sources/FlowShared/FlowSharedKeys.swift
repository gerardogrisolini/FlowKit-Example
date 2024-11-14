//
//  FlowSharedKeys.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 12/11/24.
//

import Foundation
import FlowKit

public enum FlowSharedKeys: String, Localizable {
    case page1, page2, page3, fetch, cancel, commit, commitInfo

    public var localized: String {
        String(localized: injectedLocalized, bundle: .module)
    }
}
