//
//  AppDelegate.swift
//  iTunesTrackListApp
//
//  Created by Stepan Vasilyeu on 3/8/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: SearchViewController())
        
        return true
    }
}

