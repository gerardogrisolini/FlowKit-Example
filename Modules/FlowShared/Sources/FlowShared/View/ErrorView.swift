//
//  ErrorView.swift
//  
//
//  Created by Gerardo Grisolini on 03/03/24.
//

import SwiftUI
import FlowKit

public struct ErrorView: View, Presentable {
    public init() { }
    public var body: some View {
        VStack(spacing: 16) {
            Text(SharedKeys.genericError.localized)
            Button(SharedKeys.ok) { dismiss() }
        }
        .padding()
    }
}
