//
//  AppDelegate.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
//        self.window?.rootViewController = TabBarViewController()
//        self.window?.rootViewController = LoginNavigationViewController()
        self.window?.rootViewController = StartNavigationViewController()
        
        
        return true
    }
}

