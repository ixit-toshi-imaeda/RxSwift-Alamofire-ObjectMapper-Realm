//
//  APIManager.swift
//  RxSwift+Alamofire+ObjectMapper+Realm
//
//  Created by 今枝 稔晴 on 2018/06/22.
//  Copyright © 2018年 iXIT Corporation. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire
import ObjectMapper

class APIManager {

    /// イベント取得
    static func getEventsObservable() -> Observable<MyEvent?> {
        return RxAlamofire.requestJSON(.get, "https://connpass.com/api/v1/event/").debug().retry(3).map { pair -> MyEvent? in
            if let eventsInfo: MyEvent = Mapper<MyEvent>().map(JSONObject: pair.1)
            {
                return eventsInfo
            } else {
                return nil
            }
        }
    }
    
}
