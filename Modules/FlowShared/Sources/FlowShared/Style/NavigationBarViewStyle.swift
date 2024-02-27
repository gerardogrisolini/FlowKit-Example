//
//  NavigationBarViewStyle.swift
//  
//
//  Created by Gerardo Grisolini on 07/10/22.
//

import SwiftUI

public enum NavigationBarViewStyle<H: View> {
	case simple
	case collapsable(header: H)
}
