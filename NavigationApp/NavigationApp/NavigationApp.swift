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

// MARK: - SwiftUI

//@main
//struct NavigationApp: App {
//    @Injected(\.router) var router
//
//    init() {
//        router.register(route: Routes.module1, for: Module1View.init)
//        router.register(route: Routes.module2, for: Module2ViewController.init)
//        router.register(route: Routes.module3, for: Module3View.init)
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .navigationKit()
//        }
//    }
//}

// MARK: - UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let viewController = UIHostingController(rootView: ContentView())
        let navigationController = UINavigationController(rootViewController: viewController)
        let router = NavigationKit.initialize(navigationType: .uiKit(navigationController: navigationController))
        router.register(route: Routes.module1, for: Module1View.init)
        router.register(route: Routes.module2, for: Module2ViewController.init)
        router.register(route: Routes.module3, for: Module3View.init)

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
