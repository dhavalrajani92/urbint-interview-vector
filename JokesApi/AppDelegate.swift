//
//  AppDelegate.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: .zero)
    let navController =  UINavigationController()
    window?.rootViewController = navController
    let _ = FlowContainer(navController: navController, flowViewModel: FlowViewmodel(network: NetworkEngine()))
    window?.makeKeyAndVisible()
    return true
  }
}

