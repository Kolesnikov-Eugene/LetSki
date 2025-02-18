//
//  LetSkiApp.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 03.02.2025.
//

import SwiftUI
import Firebase
import NeedleFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    registerProviderFactories()
    FirebaseApp.configure()
    return true
  }
}

@main
struct LetSkiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        let rootComponent = RootComponent()
        WindowGroup {
            rootComponent.rootView
        }
    }
}
