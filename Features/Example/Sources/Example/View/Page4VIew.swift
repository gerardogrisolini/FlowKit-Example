//
//  Page4View.swift
//
//
//  Created by Gerardo Grisolini on 17/12/23.
//

import SwiftUI
import FlowShared

struct Page4View: FlowViewProtocol, View {
    enum Out: FlowOutProtocol {
        case page5
    }
    let model: InOutModel

	var body: some View {
		VStack {
			Button(ExampleKeys.page5.localized) {
				out(.page5)
			}
		}
        .navigationBarTitle(ExampleKeys.page4, largeMode: true)
	}
}

#Preview {
    NavigationView {
        Page4View(model: InOutModel())
    }
}
