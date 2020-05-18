//
//  AppDelegate.swift
//  MKZoomLevelDemo
//
//  Created by 김동규 on 2020/05/18.
//  Copyright © 2020 Stleam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MapViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

