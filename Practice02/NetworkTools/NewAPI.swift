//
//  NewAPI.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/12/06.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import Foundation

import Moya
import RxSwift

enum SongService {
    case all
    case detail(id:String)
}

extension SongService : TargetType{
    
    ///url
    var baseURL: URL {
        return URL(string: ENDPOINT)!
    }
    
    ///请求路径
    var path: String {
        switch self {
        case .all:
            return "/v1/sheets.json"
        case .detail(let id):
            return "/v1/sheets/\(id).json"
        }
    }
    
    ///请求方法
    var method: Moya.Method {
        return .get
    }
    
    ///测试相关
    var sampleData: Data {
        return Data()
    }
    ///参数
    var task: Task {
        //暂时不传递
        return .requestPlain
    }
    
    ///请求头
    var headers: [String : String]? {
        return nil
    }
    
    
}
