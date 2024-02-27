//
//  NavigationBarModifier.swift
//  
//
//  Created by Gerardo Grisolini on 13/10/22.
//

import SwiftUI
import Combine

struct NavigationBarModifier<H: View, B: View>: ViewModifier {

	private let navigationBarHeight: CGFloat = 104

	@State private var oldOffset: CGFloat = 0
	@State private var contentHeight: CGFloat = 0
	@State private var yOffset: CGFloat = 0

	@Binding var offset: CGFloat
	let header: H
	let background: B
	
	private var headerHeight: CGFloat { contentHeight + navigationBarHeight }
	private var paddingTop: CGFloat { headerHeight + yOffset }

	func body(content: Content) -> some View {
		ZStack(alignment: .top) {
            content
                .padding(.top, paddingTop)
                .onReceive(Just(offset)) { value in
                    updateOffset(value: value)
                }

            header
                .padding(.top, navigationBarHeight)
                .readSize { value in
                    DispatchQueue.main.async {
                        contentHeight = value.height - navigationBarHeight
                    }
                }
                .frame(height: offset > 0 ? headerHeight + offset : headerHeight)
                .opacity(opacity)
                .background(background)
                .offset(y: yOffset)
        }
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		.edgesIgnoringSafeArea(.top)
		.animation(.interactiveSpring(), value: yOffset)
	}

	private func updateOffset(value: CGFloat) {
		let o = value - oldOffset
		let newOffset = yOffset + o
		oldOffset = value

		DispatchQueue.main.async {
			guard value < 0, newOffset < 0 else {
				self.yOffset = 0
				return
			}

			if newOffset < -self.contentHeight {
				self.yOffset = -self.contentHeight
				return
			}

			self.yOffset = newOffset
		}
	}

	private var opacity: CGFloat {
		1 - (abs(yOffset) / 100)
	}
}
