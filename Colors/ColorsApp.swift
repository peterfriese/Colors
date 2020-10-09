//
//  ColorsApp.swift
//  Colors
//
//  Created by Peter Friese on 08/10/2020.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    return true
  }
}


@main
struct ColorsApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  @Environment(\.scenePhase) var scenePhase
  
  init() {
    print("Colors application is starting up. App initialiser.")
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .onChange(of: scenePhase) { newScenePhase in
      switch newScenePhase {
      case .active:
        print("App is active")
      case .inactive:
        print("App is inactive")
      case .background:
        print("App is in background")
      @unknown default:
        print("Oh - interesting: I received an unexpected new value.")
      }
    }
  }
}
