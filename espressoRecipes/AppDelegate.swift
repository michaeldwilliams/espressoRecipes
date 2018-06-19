//
//  AppDelegate.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/10/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var bagStore = BagStore()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navController = window!.rootViewController as! UINavigationController
        let bagCollectionViewController = navController.viewControllers.first! as! BagCollectionViewController
        bagCollectionViewController.bagStore = bagStore
        Fabric.sharedSDK().debug = true
        Fabric.with([Crashlytics.self])
        return true
    }

}

