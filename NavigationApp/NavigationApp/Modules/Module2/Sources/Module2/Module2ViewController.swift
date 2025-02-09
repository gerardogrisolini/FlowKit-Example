//
//  Module2ViewController.swift
//  Module2
//
//  Created by Gerardo Grisolini on 09/02/25.
//

import UIKit
import Shared

public class Module2ViewController: UIViewController {
    @Injected(\.router) var router

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: "Module2ViewController", bundle: .module)
        title = "Module 2"
    }

    @IBAction func touchUpInside(_ sender: Any) {
        let param = InOutModel(value: "Hello from Module2!")
        try? router.navigate(route: Routes.module3(param))
    }
}
