//
//  AppDelegate.swift
//  DeliveryApp
//
//  Created by Stella Patricia on 18/09/20.
//  Copyright © 2020 Stella Patricia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = DeliveryListViewController()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: DeliveryListViewController())

        return true
    }

}

