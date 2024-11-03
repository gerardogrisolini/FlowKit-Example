//
//  UIKitPage1View.swift
//  Flow
//
//  Created by Gerardo Grisolini on 10/08/23.
//

import UIKit
import FlowShared

@FlowView(InOutEmpty.self, init: false)
public final class UIKitPage1View: UIViewController, FlowViewProtocol {
    public enum Out: FlowOutProtocol {
        case uikit, swiftui, empty
    }

    var collectionView: UICollectionView!
    var reuseIdentifier: String { "cell" }
    public var items = (1...48).map { $0.description }

    public init(model: InOutEmpty = InOutEmpty()) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = ExampleUIKitKeys.page1.localized
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 56, height: 278)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(collectionView)
        
        collectionView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            paddingTop: 32,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            height: 278
        )
        
        let uiKitButton = UIButton(type: .roundedRect)
		uiKitButton.setTitle(ExampleUIKitKeys.page2.localized, for: .normal)
        uiKitButton.addTarget(self, action: #selector(navigateToUIKit), for: .touchUpInside)
        view.addSubview(uiKitButton)
        
        uiKitButton.translatesAutoresizingMaskIntoConstraints = false
        uiKitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uiKitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true

        let swiftUIButton = UIButton(type: .roundedRect)
		swiftUIButton.setTitle(ExampleUIKitKeys.page3.localized, for: .normal)
        swiftUIButton.addTarget(self, action: #selector(navigateToSwiftUI), for: .touchUpInside)
        view.addSubview(swiftUIButton)
        
        swiftUIButton.translatesAutoresizingMaskIntoConstraints = false
        swiftUIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swiftUIButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
    }
    
    // MARK: - Events

    @objc func navigateToSwiftUI(_ sender: Any) {
        out(.swiftui)
    }

    @objc func navigateToUIKit(_ sender: Any) {
        out(.uikit)
    }

    func showError(item: Int) {
        let view = GenericErrorView(number: item)
        present(view)
    }
}

// MARK: - UICollectionViewDataSource

extension UIKitPage1View: UICollectionViewDataSource {
    // tell the collection view how many cells to make
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    // make a cell for each cell index path
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.label.text = items[indexPath.row] // The row value is the same as the index of the desired text within the array.
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension UIKitPage1View: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        showError(item: indexPath.item + 1)
    }
    
    // change background color when user touches cell
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }

    // change background color back when user releases touch
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.cyan
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension UIKitPage1View: UICollectionViewDelegateFlowLayout {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.scrollToNearestVisibleCollectionViewCell()
    }

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.collectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }
    
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 44.0)
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 2.0
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.0
//    }

//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.zero
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 80.0)
//    }
}


//MARK: - UICollectionViewCell

class CollectionViewCell: UICollectionViewCell {
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.cyan
        layer.cornerRadius = 16
        
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        addSubview(label)
        
        label.anchoringTo(boundsOf: self)
    }
}

#if DEBUG
import SwiftUI

#Preview {
    UIKitPage1View()
		.toSwiftUI()
        .edgesIgnoringSafeArea(.all)
}
#endif
