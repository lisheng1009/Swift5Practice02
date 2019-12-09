//
//  APIRequestExtension.swift
//  Practice02
//
//  Created by 安静清晨 on 2019/12/06.
//  Copyright © 2019 walk-in-minds. All rights reserved.
//

import Foundation

import HandyJSON
import RxSwift
import Moya

extension Observable {
    
    
    /// 转模型
    func mapModel<T: HandyJSON>(_ type: T.Type) -> Observable<T?> {
        return self.map { response in
            guard let response = response as? Moya.Response else {
                return nil
            }
            let dataString = String.init(data: response.data, encoding: .utf8)
          
            guard let  result = JSONDeserializer<T>.deserializeFrom(json: dataString) else {
                //转为对象失败
                //抛出错误
                return nil
            }
            
            //返回解析后的对象
            return result
        }
        
    }
    
    /// 指定的某个 Key 对应的模型
    public func mapObject<T: HandyJSON>(_ type: T.Type ,designatedPath: String) -> Observable<T?>{
        return self.map { response in
            guard let response = response as? Moya.Response else {
                return nil
            }
            let dataString = String.init(data: response.data, encoding: .utf8)
          
            guard let  result = JSONDeserializer<T>.deserializeFrom(json: dataString, designatedPath: designatedPath) else {
                //转为对象失败
                //抛出错误
                return nil
            }
            
            //返回解析后的对象
            return result
        }

    }
    
    ///返回指定的某个 Key 的内容对应的model数组
    public func mapObjectArray<T: HandyJSON>(_ type: T.Type ,designatedPath: String) -> Observable<[T]?>{
        return self.map { response in
            guard let response = response as? Moya.Response else {
                return nil
            }
            let dataString = String.init(data: response.data, encoding: .utf8)
          
            guard let  result = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString, designatedPath: designatedPath) else {
                //转为对象失败
                //抛出错误
                return nil
            }
            
            //返回解析后的对象
            return result as! [T]
        }

    }
    
    /// 输出error
    func showError() -> Observable<E> {
        return self.do(onError: { (error) in
            print("\(error.localizedDescription)")
        })
    }
}

