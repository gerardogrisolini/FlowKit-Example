//
//  UIKitView1.swift
//  Flow
//
//  Created by Gerardo Grisolini on 07/08/23.
//

import UIKit
import FlowShared

@FlowView(InOutModel.self, init: false)
public final class UIKitView1: UIViewControllerBase, FlowViewProtocol {
    public enum Out: FlowOutProtocol {
        case page2
    }

    @IBOutlet weak var framework: UILabel!

    required public init(model: InOutModel = InOutModel()) {
        self.model = model
        super.init(nibName: "UIKitView1", bundle: .module)
        title = "Page 1"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        framework.text = model.info
    }

    @IBAction func navigateToPage2(_ sender: Any) {
        out(.page2)
    }
}

#Preview {
    let navigationController = UINavigationController(rootViewController: UIKitView1())
    navigationController.navigationBar.prefersLargeTitles = true
    return navigationController
}
