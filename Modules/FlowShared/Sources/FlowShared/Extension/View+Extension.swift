//
//  View+Extension.swift
//  
//
//  Created by Gerardo Grisolini on 07/10/22.
//

import SwiftUI

public struct OffsetKey: PreferenceKey {
	public static var defaultValue = CGFloat.zero
	public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value += nextValue()
	}
}

public struct SizePreferenceKey: PreferenceKey {
	public static var defaultValue: CGSize = .zero
	public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

public extension View {

    func navigationBarTitle(_ localizable: any Localizable, largeMode: Bool = false) -> some View {
#if os(iOS)
        navigationBarTitle(localizable.localized, displayMode: largeMode ? .large : .inline)
        #else
        EmptyView()
#endif
    }

    @ViewBuilder
	func offset(coodinateSpace: String, offset: @escaping (CGFloat) -> ()) -> some View {
		self.overlay(
			GeometryReader { proxy in
				let minY = proxy.frame(in: .named(coodinateSpace)).minY
				
				Color.clear
					.preference(key: OffsetKey.self, value: minY)
			}
		)
		.onPreferenceChange(OffsetKey.self) { value in
			offset(value)
		}
	}
	
#if canImport(UIKit)
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
	}
#endif

	func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
		background(
			GeometryReader { geometryProxy in
				Color.clear
					.preference(key: SizePreferenceKey.self, value: geometryProxy.size)
			}
		)
		.onPreferenceChange(SizePreferenceKey.self, perform: onChange)
	}

#if canImport(UIKit)
    var bounds: CGSize { UIScreen.main.bounds.size }
#else
    var bounds: CGSize { NSScreen.main?.visibleFrame.size ?? .zero }
#endif
}
