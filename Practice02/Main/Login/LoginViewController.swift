//
//  LoginViewController.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/11/26.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func toLogin(_ sender: Any) {
        self.navigationController?.pushViewController(OrdinaryLoginViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        if self.navigationController != nil {
            let navBarHairlineImageView = self.findHairlineImageViewUnder(sView: self.navigationController!.navigationBar)
            navBarHairlineImageView.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.navigationController != nil {
            let navBarHairlineImageView = self.findHairlineImageViewUnder(sView: self.navigationController!.navigationBar)
            navBarHairlineImageView.isHidden = false
        }
        
    }
    func findHairlineImageViewUnder(sView: UIView) ->UIImageView {
        if sView.isKind(of: UIImageView.self) && sView.bounds.height <= 1 {
            return sView as! UIImageView
        }
        for sview in sView.subviews {
            let imgs = self.findHairlineImageViewUnder(sView: sview)
            if imgs.isKind(of: UIImageView.self) && imgs.bounds.height <= 1 {
                return imgs
            }
        }
        return UIImageView.init()
    }

}
