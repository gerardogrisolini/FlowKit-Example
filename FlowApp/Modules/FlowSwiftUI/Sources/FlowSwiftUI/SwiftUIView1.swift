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
                .listRowBackground(Color.white.opacity(0.1))
            }
            .scrollContentBackground(.hidden)
            .uiKit { view in
                if let v = view as? UICollectionView {
                    v.collectionViewLayout = compositionalLayout
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

    let compositionalLayout: UICollectionViewCompositionalLayout = {
        let fraction: CGFloat = 1 / 3

        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Section
        let section = NSCollectionLayoutSection(group: group)
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
