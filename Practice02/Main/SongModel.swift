//
//  SongModel.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/12/06.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import UIKit
import HandyJSON

class SongModel: HandyJSON {

    required init(){}
    /// id
    var id: String!

    /// 标题
    var title:String!
    
    /// 封面
    var banner:String?
    
    /// 描述
    var description:String?
    
    /// 点击数
    var clicks_count:Int = 0
    
    /// 收藏数
    var collections_count:Int = 0
    
    /// 评论数
    var comments_count:Int = 0
    
    /// 音乐数
    var songs_count:Int = 0
    
    ///user
    var user: userModel?
    
}


class userModel: HandyJSON {
    
    required init(){}
    
    /// id
    var id: String!

    /// 昵称
    var nickname:String!
    
    /// 头像
    var avatar:String?
    
    /// 性别
    var gender:Int!
}

