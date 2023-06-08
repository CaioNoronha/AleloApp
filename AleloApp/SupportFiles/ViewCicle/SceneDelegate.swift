//
//  SceneDelegate.swift
//  MarvelFan
//
//  Created by Caio Noronha on 27/07/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionsOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let main = HomeViewController()
            window.rootViewController = UINavigationController(rootViewController: main)
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

