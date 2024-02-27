//
//  FlowApp.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 09/01/24.
//

import SwiftUI
import FlowNetwork
import FlowShared

@main
struct FlowApp: App, FlowKitApp {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        register(navigation: NavigationSwiftUI())
        register(scope: .application) {
            FlowNetwork() as FlowNetworkProtocol
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .swiftUINavigation()
        }
    }
}

// MARK: - UIKit navigation
/*
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    @Injected var navigation: NavigationProtocol
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {

            let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: ContentView()))
            navigation.navigationController = navigationController
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
*/
