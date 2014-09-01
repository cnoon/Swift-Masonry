//
//  AppDelegate.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow!

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        let navController = UINavigationController(rootViewController: ExampleListViewController())
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window.rootViewController = navController
        window.backgroundColor = UIColor.whiteColor()
        window.makeKeyAndVisible()

        return true
    }
}
