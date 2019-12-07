//
//  SongWrapper.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/12/06.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import Foundation
import HandyJSON

class SongWrapper:HandyJSON {    
    /// 因为实现了HandyJSON
    /// 他要求有一个init方法
    required init() {}
    var data:SongModel!
}
