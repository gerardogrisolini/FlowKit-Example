//
//  UIKitView2.swift
//  FlowUIKit
//
//  Created by Gerardo Grisolini on 11/11/24.
//

import UIKit
import FlowShared

@FlowView(InOutEmpty.self, init: false)
class UIKitView2: UIKitBaseView, FlowViewProtocol {
    public enum Out: FlowOutProtocol {
        case page3
    }

    required init(model: InOutEmpty = InOutEmpty()) {
        self.model = model
        super.init(nibName: "UIKitView2", bundle: .module)
        title = "Page 2"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func navigateToPage3(_ sender: Any) {
        out(.page3)
    }
}

#Preview {
    let navigationController = UINavigationController(rootViewController: UIKitView2())
    navigationController.navigationBar.prefersLargeTitles = true
    return navigationController
}
