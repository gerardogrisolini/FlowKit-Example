//
//  UIViewControllerBase.swift
//  FlowShared
//
//  Created by Gerardo Grisolini on 11/11/24.
//

import UIKit
import FlowKit

open class UIViewControllerBase: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()

        let background = AnimatedColorsMeshGradientView().toUIView()
        view.insertSubview(background, at: 0)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

#if canImport(UIKit)
import SwiftUI

public extension View {
    func toUIView() -> UIView {
        UIHostingController(rootView: self).view!
    }
}
#endif
