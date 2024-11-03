//
//  Page1View.swift
//
//
//  Created by Gerardo Grisolini on 03/02/23.
//

import SwiftUI
import FlowShared

@FlowView(InOutModel.self)
public struct Page1View: FlowViewProtocol, View {
    @FlowCases
    public enum Out: FlowOutProtocol {
        case page2(InOutModel)
        case page5(InOutModel)
    }

	public var body: some View {
        VStack(spacing: 32) {
			Button(ExampleKeys.page2) {
                out(.page2(model))
			}
            Button(ExampleKeys.page5) {
                out(.page5(model))
            }
        }
        .navigationBarTitle(ExampleKeys.page1, largeMode: true)
	}
}

#Preview {
    NavigationView {
        Page1View()
    }
}
