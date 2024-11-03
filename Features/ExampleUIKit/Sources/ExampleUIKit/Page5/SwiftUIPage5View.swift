//
//  SwiftUIPage5View.swift
//  
//
//  Created by Gerardo Grisolini on 18/09/23.
//

import UIKit
import FlowShared

@FlowView(InOutEmpty.self, init: false)
final class SwiftUIPage5View: UIViewController, FlowViewProtocol {
    
    required init(model: InOutEmpty) {
        self.model = model
        super.init(nibName: "SwiftUIPage5View", bundle: .module)
		title = ExampleUIKitKeys.page5.localized
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setData(with: [String]) {
		commit(model)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        setData(with: ["1", "2", "3"])
    }
}
