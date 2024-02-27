//
//  ScrollReaderModifier.swift
//  
//
//  Created by Gerardo Grisolini on 23/02/23.
//

import SwiftUI
import Combine

struct ScrollReaderModifier: ViewModifier {

	private let detector = CurrentValueSubject<CGFloat, Never>(0)
	private var offset: Binding<CGFloat>
	private var cancellable: Cancellable?
	private var onEnded: (CGFloat) -> ()

	init(offset: Binding<CGFloat>, onEnded: @escaping (CGFloat) -> ()) {
		self.offset = offset
		self.onEnded = onEnded
		
		cancellable = detector
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.receive(on: RunLoop.main)
			.sink(receiveValue: { value in
				onEnded(value)
			})
	}

	func body(content: Content) -> some View {
		ScrollView(.horizontal, showsIndicators: false) {
			content
				.background(
					GeometryReader {
						let x = -$0.frame(in: .named("scroll")).origin.x
						Color.clear.preference(key: ViewOffsetKey.self, value: x)
					}
				)
				.onPreferenceChange(ViewOffsetKey.self) { value in
					offset.wrappedValue = value
					detector.send(value)
				}
		}
		.coordinateSpace(name: "scroll")
	}
}

struct ViewOffsetKey: PreferenceKey {
	typealias Value = CGFloat
	static var defaultValue = CGFloat.zero
	static func reduce(value: inout Value, nextValue: () -> Value) {
		value += nextValue()
	}
}

extension View {
	public func scrollReader(
		offset: Binding<CGFloat> = .constant(0),
		onEnded: @escaping (CGFloat) -> () = { _ in }
	) -> some View {
		modifier(ScrollReaderModifier(offset: offset, onEnded: onEnded))
	}
}

