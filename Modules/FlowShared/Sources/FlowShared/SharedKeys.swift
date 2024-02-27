//
//  SharedKeys.swift
//
//
//  Created by Gerardo Grisolini on 02/04/23.
//

import Foundation
import FlowKit

public enum SharedKeys: String, Localizable {
	case ok, cancel

	public var localized: String {
		String(localized: injectedLocalized, bundle: .module)
	}
}
