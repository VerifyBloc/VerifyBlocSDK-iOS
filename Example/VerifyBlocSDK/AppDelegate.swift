//
//  AppDelegate.swift
//  VerifyBlocSDK
//
//  Created by 修齐 on 12/10/2022.
//  Copyright (c) 2022 修齐. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

