//
//  SceneDelegate.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/11/21.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let guideVC = GuideViewController()
        self.window = UIWindow.init(windowScene: scene as! UIWindowScene)
        self.window?.rootViewController = guideVC
        self.window?.makeKeyAndVisible()
        guideVC.enterMain = {
            self.window?.rootViewController = MainController()
        }
        
        guideVC.enterLog = {
           
            let navi = UINavigationController(rootViewController: LoginViewController())
            self.window?.rootViewController = navi
        }
        
        let notName = Notification.Name(rawValue: "changeTopBar")
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadData), name: notName, object: nil)

    }
    
    @objc func reloadData(){
        self.window?.rootViewController = MainController()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

