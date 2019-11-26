//
//  QiuBaiModel.swift
//  common
//
//  Created by 安静清晨 on 2019/11/12.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit

class QiuBaiModel: NSObject {
    @objc var content: String = ""
    @objc var name:String = ""
    @objc var userId:String = ""
    @objc var user:[String:NSObject]?{
        didSet{
            name = self.user!["login"] as! String
            let num = self.user!["id"] as! NSNumber
            let ss = num.stringValue
            userId = "id: \(ss)"
        }
    }
    init(dict:[String : NSObject]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
