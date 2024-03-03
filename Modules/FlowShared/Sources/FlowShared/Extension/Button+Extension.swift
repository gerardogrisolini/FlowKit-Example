//
//  Button+Extension.swift
//
//
//  Created by Gerardo Grisolini on 17/02/24.
//

import SwiftUI

public extension Button where Label == Text {
    init(_ localizable: any Localizable, action: @escaping () -> Void) {
        self.init(localizable.localized, action: action)
    }
}
