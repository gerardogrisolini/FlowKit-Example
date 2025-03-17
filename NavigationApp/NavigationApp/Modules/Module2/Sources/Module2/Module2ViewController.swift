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

    override public func viewDidLoad() {
        loadData()
    }

    private func loadData() {
        Task {
            router.present(.loader())
            try await Task.sleep(nanoseconds: 3_000_000_000)
            router.dismiss()
        }
    }

    @IBAction func touchUpInside(_ sender: UIButton) {
        let param = InOutModel(value: "Hello from Module2!")
        try? router.navigate(route: Routes.module3(param))
    }

    @IBAction func reloadTouchUpInside(_ sender: UIButton) {
        loadData()
    }
}

@available(iOS 17.0, *)
@available(macOS 14.0, *)
#Preview {
    let navigationController = UINavigationController(rootViewController: Module2ViewController())
    navigationController.navigationBar.prefersLargeTitles = true
    NavigationKit.initialize(navigationType: .uiKit(navigationController: navigationController))
    return navigationController
}
