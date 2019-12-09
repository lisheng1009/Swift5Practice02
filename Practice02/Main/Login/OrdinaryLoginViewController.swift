//
//  OrdinaryLoginViewController.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/11/27.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class OrdinaryLoginViewController: UIViewController {
    
    lazy var alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func toLogin(_ sender: Any) {
        
        //TODO: 注册登录逻辑里可以使用guard
        
        if phoneTextField.text == "" {
            alert.message = "手机号码不能为空"
            self.present(alert, animated: true, completion: nil)
        }else if !(phoneTextField.text?.isValidPhoneNum())! {
            alert.message = "请输入正确的手机号码"
            self.present(alert, animated: true, completion: nil)
        }else if passwordTextField.text == "" {
            alert.message = "密码不能为空"
            self.present(alert, animated: true, completion: nil)
        }else if passwordTextField.text!.count < 6 {
            alert.message = "密码长度不能小于6"
            self.present(alert, animated: true, completion: nil)
        }else{
            
            //需要验证 暂时省略
            //TODO
            
            let alert2 = UIAlertController(title: "", message: "登录成功", preferredStyle: .alert)
            self.present(alert2, animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {

                alert2.dismiss(animated: false, completion: nil)
                
                let notName = Notification.Name(rawValue: "changeTopBar")
                NotificationCenter.default.post(name: notName, object: self, userInfo: nil)
            }

        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barb = UIBarButtonItem(image: UIImage(named: "arrow_left.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = barb
        
        let confirm = UIAlertAction(title: "知道了", style: .default, handler: nil)
        alert.addAction(confirm)
        

        
    }
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
