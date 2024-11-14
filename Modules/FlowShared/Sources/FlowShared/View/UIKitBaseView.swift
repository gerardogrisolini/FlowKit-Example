//
//  UIKitBaseView.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 11/11/24.
//

import UIKit

open class UIKitBaseView: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()

        let background = AnimatedColorsMeshGradientView().toUIKit()
        view.insertSubview(background, at: 0)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
