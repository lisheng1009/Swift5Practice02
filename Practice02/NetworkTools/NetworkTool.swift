//
//  NetworkTool.swift
//  common
//
//  Created by 安静清晨 on 2019/11/08.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTool {
    class func requestData(urlString: String, type: MethodType, paras:[String: Any]? = nil, finishCallback: @escaping (_:Any)->()){
        
        let method = type == MethodType.GET ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(urlString, method: method, parameters: paras).responseJSON { (response) in
            
            guard let res = response.result.value else{
                print(response.result.error as Any)
                return
            }
            finishCallback(res)
        }
    
    }
}
