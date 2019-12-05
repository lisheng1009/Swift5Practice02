//
//  BaseNavigationController.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/12/05.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let b = UIButton()
//        b.setImage(UIImage(named: "arrow_left"), for: .normal)
//        navigationItem.backBarButtonItem = UIBarButtonItem(customView: b)
//        print("................")
    }
    
    @objc func goBack(){
        self.popViewController(animated: true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        let barb = UIBarButtonItem(image: UIImage(named: "arrow_left.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goBack))
//        navigationItem.backBarButtonItem = barb
    }

    
}
