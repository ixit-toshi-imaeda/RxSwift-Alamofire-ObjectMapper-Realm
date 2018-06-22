//
//  MyEventDetail.swift
//  RxSwift+Alamofire+ObjectMapper+Realm
//
//  Created by 今枝 稔晴 on 2018/06/22.
//  Copyright © 2018年 iXIT Corporation. All rights reserved.
//

import Foundation
import ObjectMapper
import RxDataSources

class MyEventDetail: Mappable {
    
    var eventId = ""
    var title = ""
    var `catch` = ""
    
    func mapping(map: Map) {
    }
    
    required init?(map: Map) {
        eventId <- map["event_id"]
        title <- map["title"]
        `catch` <- map["catch"]
    }
    
}

/// RxDataSources を使うための宣言（セクション情報）
struct SectionOfMyEventDetail {
    var header: String
    var items: [Item]
}
extension SectionOfMyEventDetail: SectionModelType {
    typealias Item = MyEventDetail
    
    init(original: SectionOfMyEventDetail, items: [Item]) {
        self = original
        self.items = items
    }
}
