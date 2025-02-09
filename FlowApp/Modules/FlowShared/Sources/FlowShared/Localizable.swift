//
//  FlowSharedKeys.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 12/11/24.
//

import Foundation
import FlowKit

public protocol Localizable: Hashable, RawRepresentable where RawValue: StringProtocol {
    var localized: String { get }
}

public enum FlowSharedKeys: String, Localizable {
    case page1, page2, page3, fetch, cancel, commit, commitInfo

    public var localized: String {
        String(localized: "\(rawValue)", bundle: .module)
    }
}
