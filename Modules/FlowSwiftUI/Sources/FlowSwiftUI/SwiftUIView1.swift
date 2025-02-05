//
//  SwiftUIView1.swift
//  FlowSwiftUI
//
//  Created by Gerardo Grisolini on 10/11/24.
//

import SwiftUI
import FlowShared

@FlowView(InOutModel.self)
public struct SwiftUIView1: View, FlowViewProtocol {
    public enum Out: FlowOutProtocol {
        case page2
    }

    public var body: some View {
        VStack(spacing: 20) {
            Text(model.info)

            Button(FlowSharedKeys.page2.localized) {
                out(.page2)
            }

            List {
                ForEach(1...50, id: \.self) { i in
                    Button(action: { showAlert(value: i) }) {
                        Text(i.description)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .clipShape(Rectangle())
                    }
                }
            }
            .listStyle(.grouped)
            .uiKit { view in
                if let v = view as? UICollectionView {
                    v.collectionViewLayout = compositionalLayout2
                }
            }
        }
        .navigationTitle(FlowSharedKeys.page1.localized)
        .backgroundShared()
    }

    private func showAlert(value: Int) {
        switch value {
        case 1:
            let actions: [AlertAction] = [
                .init(title: "One", style: .default, handler: {}),
                .init(title: "Two", style: .destructive, handler: {})
            ]
            present(.confirmationDialog(title: "ConfirmationDialog", actions: actions))
        case 2:
            present(.sheet(SheetView(value: value)))
        case 3:
            present(.fullScreenCover(SheetView(value: value)))
        default:
            present(.alert(title: "Tapped", message: value.description))
        }
    }

//    let compositionalLayout1: UICollectionViewCompositionalLayout = {
//        let fraction: CGFloat = 1 / 3
//
//        // Item
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        // Group
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//
//        // Section
//        let section = NSCollectionLayoutSection(group: group)
//        return UICollectionViewCompositionalLayout(section: section)
//    }()

    let compositionalLayout2: UICollectionViewCompositionalLayout = {
        let inset: CGFloat = 2.5

        // Items
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        largeItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        // Nested Group
        let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1))
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize, subitems: [smallItem])

        // Outer Group
        let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let outerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: outerGroupSize, subitems: [largeItem, nestedGroup, nestedGroup])

        // Section
        let section = NSCollectionLayoutSection(group: outerGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        // Supplementary Item
//        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
//        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//        section.boundarySupplementaryItems = [headerItem]

//        section.orthogonalScrollingBehavior = .groupPaging
//
//        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
//            items.forEach { item in
//                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
//                let minScale: CGFloat = 0.7
//                let maxScale: CGFloat = 1.1
//                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
//                item.transform = CGAffineTransform(scaleX: scale, y: scale)
//            }
//        }

        return UICollectionViewCompositionalLayout(section: section)
    }()
}

fileprivate struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    let value: Int
    var body: some View {
        Button(value.description, action: { dismiss() })
    }
}

#Preview(traits: .navEmbedded) {
    SwiftUIView1().preview()
}
