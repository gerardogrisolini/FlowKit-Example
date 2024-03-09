//
//  StackedCards.swift
//
//
//  Created by Gerardo Grisolini on 09/03/24.
//

import SwiftUI

struct StackedCards: View {
    @State private var isRotationEnabled: Bool = true
    @State private var showsIndicator: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader {
                    let size = $0.size

                    ScrollView (.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(items) { item in
                                CardView(item)
                                    .padding(.horizontal, 64)
                                    .frame(width: size.width)
                                    .visualEffect { content, geometryProxy in
                                        content
                                            .scaleEffect(scale(geometryProxy, scale: 0.1), anchor: .trailing)
                                            .rotationEffect(rotation(geometryProxy, rotation: isRotationEnabled ? 5 : 0))
                                            .offset(x: minX(geometryProxy))
                                            .offset(x: excessMinX(geometryProxy, offset: isRotationEnabled ? 8 : 10))
                                    }
                                    .zIndex(items.zIndex(item))
                            }
                        }
                        .padding(.vertical, 15)
                    }
                    .scrollTargetBehavior(.paging)
                    .scrollIndicators(showsIndicator ? .visible : .hidden)
                    .scrollIndicatorsFlash(trigger: showsIndicator)
                }
                .frame(height: 430)
                .animation(.snappy, value: isRotationEnabled)

                VStack {
                    Toggle("Rotation Enabled", isOn: $isRotationEnabled)
                    Toggle("Scroll Indicator", isOn: $showsIndicator)
                }
                .padding(15)
                .background(.bar, in: .rect(cornerRadius: 10))
                .padding(15)
            }
            .navigationTitle("Stacked Cards")
        }
    }

    @ViewBuilder
    func CardView(_ item: Item) -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(item.color.gradient)
    }

    // Stacked Cards Animation
    func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }

    func progress(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat {
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0

        /// Converting into Progress
        let progress = (maxX / width) - 1.0
        let cappedProgress = min(progress, limit)

        return cappedProgress
    }

    func scale(_ proxy: GeometryProxy, scale: CGFloat = 0.1) -> CGFloat {
        let progress = progress(proxy, limit: 3)
        return 1 - (progress * scale)
    }

    func excessMinX(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
        let progress = self.progress(proxy)
        return progress * offset
    }

    func rotation(_ proxy: GeometryProxy, rotation: CGFloat = 10) -> Angle {
        let progress = self.progress(proxy)
        return .init(degrees: progress * rotation)
    }
}

#Preview {
    StackedCards()
}

struct Item: Identifiable {
    var id: UUID = .init()
    var color: Color
}

var items: [Item] = [
    .init(color: .red),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .yellow),
    .init(color: .pink),
    .init(color: .purple)
]

extension [Item] {
    func zIndex(_ item: Item) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }

        return .zero
    }
}
