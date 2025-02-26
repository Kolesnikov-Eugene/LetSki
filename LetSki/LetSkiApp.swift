//
//  LetSkiApp.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 03.02.2025.
//

import SwiftUI
import Firebase
import NeedleFoundation
import LetSkiShared

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // MARK: - init Needle Root component
        registerProviderFactories()
        // MARK: - configure firebase
        FirebaseApp.configure()
        // MARK: - configure tabbar appearance
        configureTabBarAppearance()
        
        return true
    }
    
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
//        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = nil
        appearance.shadowColor = nil
        appearance.shadowImage = nil
        appearance.backgroundColor = .clear
//        appearance.backgroundColor = UIColor(resource: .splash)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

@main
struct LetSkiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var loggedInState = Session()
    
    var body: some Scene {
        let rootComponent = RootComponent()
        WindowGroup {
            rootComponent.rootView
                .environmentObject(loggedInState)
        }
    }
}
