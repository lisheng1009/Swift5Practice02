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
extension ObservableType where E == Response {
    public func mapModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapModel(T.self))
        }
    }
}
extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        guard let object = JSONDeserializer<T>.deserializeFrom(json: try mapString()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
}

