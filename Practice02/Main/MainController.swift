//
//  MainController.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/11/26.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        tabBar.barTintColor = UIColor.white
        
        addChild("首页", "home", "home_selected", HomeViewController.self)
        addChild("中间", "middle", "middle_selected", MiddleViewController.self)
        addChild("我的", "my", "my_selected", MyViewController.self)
    }
    

    
    
    func addChild(_ title: String,
                  _ imageName: String,
                  _ selectedImageName: String,
                  _ type: UIViewController.Type){
        
        let nav = UINavigationController(rootViewController: type.init())
        nav.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        nav.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .selected)
        
        addChild(nav)
        
    }

}
