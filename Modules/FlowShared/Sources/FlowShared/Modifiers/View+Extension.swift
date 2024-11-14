//
//  View+Extension.swift
//  Shared
//
//  Created by Gerardo Grisolini on 21/09/24.
//

import SwiftUI

public extension View {
    func backgroundShared() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AnimatedColorsMeshGradientView())
//        .background(Color.green.opacity(0.2))
    }
}
