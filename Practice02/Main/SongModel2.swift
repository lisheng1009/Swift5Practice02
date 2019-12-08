//
//  SongModel2.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/12/08.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import HandyJSON

class songs: HandyJSON {
    required init(){}
    var songsong : [SongModel2]?
}

class SongModel2: HandyJSON {
    required init(){}
    /// id
    var id: String!

    /// 标题
    var title:String!
    
    /// 封面
    var banner:String?
    
    /// url?
    var uri:String?
    
    /// 点击数
    var clicks_count:Int = 0
    
    /// 评论数
    var comments_count:Int = 0
    
    ///user
    var user: userModel?
}

