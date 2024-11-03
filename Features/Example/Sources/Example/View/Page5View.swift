//
//  Page5View.swift
//
//
//  Created by Gerardo Grisolini on 03/02/23.
//

import SwiftUI
import FlowShared

@FlowView(InOutModel.self)
struct Page5View: FlowViewProtocol, View {
	var body: some View {
		VStack {
			Button("Commit") {
				commit(model, toRoot: true)
			}
		}
        .navigationBarTitle(ExampleKeys.page5, largeMode: true)
	}
}

#Preview {
    NavigationView {
        Page5View(model: InOutModel())
    }
}
