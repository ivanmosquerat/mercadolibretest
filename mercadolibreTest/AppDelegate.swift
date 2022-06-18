//
//  AppDelegate.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        let initialViewController = MainListViewController()
        navigationController.pushViewController(initialViewController, animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        return true
    }
}

