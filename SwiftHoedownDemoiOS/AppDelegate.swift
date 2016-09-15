//
//  AppDelegate.swift
//  SwiftHoedownDemoiOS
//
//  Created by Niels de Hoog on 15/09/15.
//  Copyright © 2015 Invisible Pixel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = WebViewController()
        self.window!.makeKeyAndVisible()
        return true
    }
}

