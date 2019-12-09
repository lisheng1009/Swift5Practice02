//
//  MyViewController.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/11/26.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        

        let b = UIButton.createButton(title: "dianwo", color: MAIN_COLOR)
        b.sizeToFit()
        b.center = view.center
        view.addSubview(b)
        b.addTarget(self, action: #selector(dd), for: .touchUpInside)
    }
    
    @objc func dd(){
        self.view.customShowHUD(text: "hiuhdfiechubdfhunsdvhfbvhudsbhvcbdbchbchuebchebcebchyevdcveuvuyersssssssss", delay: 3.0)
    }
}
