//
//  FlowApp.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 28/10/24.
//

import SwiftUI
//import UIKit
import SwiftData
import FlowKit

@main
struct FlowApp: App {
    @Injected(\.modelContainer) var modelContainer

    init () {
        FlowKit.initialize()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .join(flow: AppFlow())
         }
        .modelContainer(modelContainer)
    }
}

/*
 @main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
        return true
    }
}

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    @Injected(\.modelContainer) var modelContainer
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let rootView = ContentView()
        let viewController = UIHostingController(rootView: rootView.modelContainer(modelContainer))
        let navigationController = UINavigationController(rootViewController: viewController)
        FlowKit.initialize(navigationType: .uiKit(navigationController: navigationController))

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        Task {
            do {
                try await AppFlow().start(parent: rootView, navigate: false)
            } catch {
                print(error)
            }
        }
    }
}
*/
