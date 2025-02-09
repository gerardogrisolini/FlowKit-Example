//
//  NavigationAppApp.swift
//  NavigationApp
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import SwiftUI
import Shared
import Module1
import Module2
import Module3

@main
struct NavigationApp: App {

    init() {
        initialize()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .navigationKit()
        }
    }

    private func initialize() {
        let router = NavigationKit.initialize()
        router.register(route: Routes.module1, for: Module1View.init)
        router.register(route: Routes.module2, for: Module2ViewController.init)
        router.register(route: Routes.module3, for: Module3View.init)
    }
}
