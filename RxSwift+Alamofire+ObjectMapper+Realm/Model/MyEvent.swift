//
//  MyEvent.swift
//  RxSwift+Alamofire+ObjectMapper+Realm
//
//  Created by 今枝 稔晴 on 2018/06/22.
//  Copyright © 2018年 iXIT Corporation. All rights reserved.
//

import Foundation
import ObjectMapper

class MyEvent: Mappable {
    var resultsReturned = 0
    var resultsAvailable = 0
    var resultsStart = 0
    var events = [MyEventDetail]()
    
    func mapping(map: Map) {
    }
    
    required init?(map: Map) {
        resultsReturned <- map["results_returned"]
        resultsAvailable <- map["results_available"]
        resultsStart <- map["results_start"]
        events <- map["events"]
    }
}
