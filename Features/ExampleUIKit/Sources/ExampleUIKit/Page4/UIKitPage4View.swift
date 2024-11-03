//
//  UIKitPage4.swift
//
//
//  Created by Gerardo Grisolini on 05/08/23.
//

import UIKit
import SwiftUI
import FlowShared

struct MyCollectionCellView: View {
    let label: String
    var body: some View {
        Text(label)
    }
}

class MyCollectionViewHeader: UICollectionReusableView {
    static var reuseIdentifier: String { "cellHeader" }
    var label: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        backgroundColor = .orange;
        layer.cornerRadius = 8

        addViews()
    }
    
    private func addViews() {
        label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 26)
        label.textAlignment = .center
        addSubview(label)
        
        label.anchoringTo(boundsOf: self)
    }
}

@FlowView(InOutEmpty.self, init: false)
public final class UIKitPage4View: UIViewController, FlowViewProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    var data = InOutEmpty()

    let compositionalLayout: UICollectionViewCompositionalLayout = {
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
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [headerItem]
         
        section.orthogonalScrollingBehavior = .groupPaging
        
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

    public var items = (1...48).map { $0.description }

    public init(model: InOutEmpty) {
        fatalError("init(viewModel:) has not been implemented")
    }

    required init?(coder: NSCoder) {
        self.model = InOutEmpty()
        super.init(coder: coder)
    }
    
    public static func factory(model: some InOutProtocol) async throws -> Self {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: .module)
        let vc = storyboard.instantiateViewController(withIdentifier: "UIKitPage4View") as! UIKitPage4View
        vc.title = ExampleUIKitKeys.page4.localized
        vc.data = model as! InOutEmpty
        return vc as! Self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Ok", style: .plain, target: self, action: #selector(finishTapped))
        collectionView.collectionViewLayout = compositionalLayout
    }
    
    @objc public func finishTapped() {
        commit(data)
    }
}

// MARK: - UICollectionViewDataSource protocol

extension UIKitPage4View: UICollectionViewDataSource {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MyCollectionViewHeader.reuseIdentifier, for: indexPath) as! MyCollectionViewHeader
            headerView.label.text = "\(indexPath.section)" // The row value is the same as the index of the desired text within the array.
            return headerView
            
        default:
            assertionFailure("Unexpected element kind: \(kind).")
            return UICollectionReusableView()
        }
    }
    
    // tell the collection view how many cells to make
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    // make a cell for each cell index path
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        cell.backgroundColor = .cyan
        cell.layer.cornerRadius = 8
        if #available(iOS 16.0, *) {
            cell.contentConfiguration = UIHostingConfiguration {
                MyCollectionCellView(label: items[indexPath.row])
            }
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate protocol

extension UIKitPage4View: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        let view = GenericErrorView(number: indexPath.item + 1)
        present(view)
    }
    
    // change background color when user touches cell
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .red
    }

    // change background color back when user releases touch
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .cyan
    }
}
