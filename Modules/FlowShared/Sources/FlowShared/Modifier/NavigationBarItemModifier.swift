//
//  NavigationBarItemModifier.swift
//  
//
//  Created by Gerardo Grisolini on 13/10/22.
//

import SwiftUI

struct NavigationBarItemModifier<T: View, L: View, R: View>: ViewModifier {
	let title: T
	let leading: L
	let trailing: R
	var foregroundColor: Color = Color.white
	@Binding var offset: CGFloat

	func body(content: Content) -> some View {
		ZStack(alignment: .top) {
			content
			
			HStack(spacing: 16) {
				leading
				Spacer()
				title
				Spacer()
				trailing
			}
			.padding([.horizontal, .bottom], 16)
			.frame(maxWidth: .infinity, minHeight: 104, maxHeight: 104, alignment: .bottom)
			.foregroundColor(foregroundColor)
			.background(Color.primary.opacity(offset < -100 ? 0.1 : 0).animation(.easeInOut))
		}
		.edgesIgnoringSafeArea(.top)
	}
}
