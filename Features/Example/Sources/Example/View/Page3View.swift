//
//  Page3View.swift
//
//
//  Created by Gerardo Grisolini on 03/02/23.
//

import SwiftUI
import FlowShared

public struct Page3View: FlowViewProtocol, View {
	@ObservedObject var viewModel = Page3ViewModel()

    public let model: InOutModel
    public init(model: InOutModel = InOutModel()) {
        self.model = model
    }

	private var header: some View {
		Text("Stretchy Header")
			.font(.title)
			.foregroundColor(.white)
			.frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200, alignment: .center)
	}
	
	private var background: some View {
		Image("background", bundle: .module)
			.resizable()
            .clipShape(RoundedRectangle(cornerSize: .init(width: 20, height: 20)))
//			.cornerRadius(8, corners: [.bottomLeft, .bottomRight])
	}

	public var body: some View {
        NavigationBarView(style: .collapsable(header: header), background: background, offset: $viewModel.offset) {
            ScrollView {
                VStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .offset(coodinateSpace: "SCROLL") { offset in
                    self.viewModel.offset = offset
                }
            }
            .coordinateSpace(name: "SCROLL")
        }
		.navigationBarItems(
			title: Text(ExampleKeys.page3.localized),
			leading: Button(action: back) {
				Image(systemName: "chevron.backward")
			},
            trailing: Button(action: { commit(model) }) {
				Image(systemName: "xmark.circle")
			},
			foregroundColor: .white
		)
#if os(iOS)
		.navigationBarHidden(true)
#endif
        .task {
            await viewModel.fetchItems()
        }
	}
}

public class Page3ViewModel: ObservableObject {
    @Published public var items: [String] = []
    @Published var offset: CGFloat = 0

    func fetchItems() async {
        let data = (1...100).map { $0.description }
        await MainActor.run { items = data }
    }
}

#Preview {
	Page3View()
}
