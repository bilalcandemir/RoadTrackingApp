//
//  AppDelegate.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 17.06.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        Router.shared.openAsRoot(viewC: SplashViewController())
        return true
    }
}

