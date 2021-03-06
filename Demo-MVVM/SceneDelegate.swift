//
//  SceneDelegate.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/23/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController()
        let topMoviesViewController = TopMoviesViewController()
        
        navigationController.overrideUserInterfaceStyle = .dark
        navigationController.viewControllers = [topMoviesViewController]
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = UIColor(named: "MainColor")
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

