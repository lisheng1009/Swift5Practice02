//
//  API.swift
//  common
//
//  Created by 安静清晨 on 2019/11/08.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import Foundation

class API: NSObject {
    let qiushi = "http://m2.qiushibaike.com/article/list/imgrank"
    let douyu = "http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1474252024"
}

/// 各code代表什么
public enum HttpStatus: Int {
    case success = 200 // 成功
    case logout = 208 // 登出
    case requestFailed = 300 //网络请求失败
    case noDataOrDataParsingFailed = 301 //无数据或解析失败
}
