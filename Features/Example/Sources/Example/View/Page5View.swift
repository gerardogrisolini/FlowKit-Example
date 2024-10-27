//
//  Page5View.swift
//
//
//  Created by Gerardo Grisolini on 03/02/23.
//

import SwiftUI
import FlowShared

struct Page5View: FlowViewProtocol, View {
    let model: InOutModel
    init(model: InOutModel) {
        self.model = model
    }

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
