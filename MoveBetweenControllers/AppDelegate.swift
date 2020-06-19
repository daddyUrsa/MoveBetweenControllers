//
//  AppDelegate.swift
//  MoveBetweenControllers
//
//  Created by Alexey Golovin on 19.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        startIntialFlow()
        
        return true
    }
    
    private func startIntialFlow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = UINavigationController(rootViewController: NavigationViewController())
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

