//
//  NavigationBarView.swift
//  FlowUI
//
//  Created by Gerardo Grisolini on 07/10/22.
//

import SwiftUI

public struct NavigationBarView<Content: View, H: View, B: View>: View {
	let style: NavigationBarViewStyle<H>
	let background: B
	let offset: Binding<CGFloat>
	let content: Content

	var navigationBarModifier: NavigationBarModifier<H, B> {
		switch style {
		case .simple:
			return NavigationBarModifier(offset: .constant(0), header: Rectangle() as! H, background: background)
		case .collapsable(let header):
			return NavigationBarModifier(offset: offset, header: header, background: background)
		}
	}
	
	public init(style: NavigationBarViewStyle<H>, background: B, offset: Binding<CGFloat> = .constant(0), @ViewBuilder content: () -> Content) {
		self.style = style
		self.background = background
		self.offset = offset
		self.content = content()
	}
	
	public var body: some View {
		content
			.modifier(navigationBarModifier)
	}
}

extension NavigationBarView where H == Rectangle {
	public init(style: NavigationBarViewStyle<H>, background: B, offset: Binding<CGFloat> = .constant(0), @ViewBuilder content: () -> Content) {
		self.style = style
		self.background = background
		self.offset = offset
		self.content = content()
	}
}

extension NavigationBarView where B == EmptyView {
	public init(style: NavigationBarViewStyle<H>, offset: Binding<CGFloat> = .constant(0), @ViewBuilder content: () -> Content) {
		self.style = style
		self.background = EmptyView()
		self.offset = offset
		self.content = content()
	}
}

extension NavigationBarView where H == Rectangle, B == EmptyView {
	public init(style: NavigationBarViewStyle<H>, offset: Binding<CGFloat> = .constant(0), @ViewBuilder content: () -> Content) {
		self.style = style
		self.background = EmptyView()
		self.offset = offset
		self.content = content()
	}
}

extension NavigationBarView {
	public func navigationBarItems<T: View>(title: T, foregroundColor: Color = Color.primary) -> some View {
		modifier(NavigationBarItemModifier(title: title, leading: EmptyView(), trailing: EmptyView(), foregroundColor: foregroundColor, offset: offset))
	}
	
	public func navigationBarItems<T: View, L: View>(title: T, leading: L, foregroundColor: Color = Color.primary) -> some View {
		modifier(NavigationBarItemModifier(title: title, leading: leading, trailing: Spacer().frame(width: 20), foregroundColor: foregroundColor, offset: offset))
	}
	
	public func navigationBarItems<T: View, R: View>(title: T, trailing: R, foregroundColor: Color = Color.primary) -> some View {
		modifier(NavigationBarItemModifier(title: title, leading: Spacer().frame(width: 20), trailing: trailing, foregroundColor: foregroundColor, offset: offset))
	}
	
	public func navigationBarItems<T: View, L: View, R: View>(title: T, leading: L, trailing: R, foregroundColor: Color = Color.primary) -> some View {
		modifier(NavigationBarItemModifier(title: title, leading: leading, trailing: trailing, foregroundColor: foregroundColor, offset: offset))
	}
}
