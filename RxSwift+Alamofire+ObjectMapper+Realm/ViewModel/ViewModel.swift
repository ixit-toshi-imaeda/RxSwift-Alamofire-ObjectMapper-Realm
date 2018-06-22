//
//  ViewModel.swift
//  RxSwift+Alamofire+ObjectMapper+Realm
//
//  Created by 今枝 稔晴 on 2018/06/22.
//  Copyright © 2018年 iXIT Corporation. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SVProgressHUD

class ViewModel {
    
    var sectionInfo: Driver<[SectionOfMyEventDetail]>
    let disposeBag = DisposeBag()
    var isLoading: Driver<Bool>
    
    init(tap: ControlEvent<(Void)>) {
        
        let activityIndicator = ActivityIndicator()
        isLoading = activityIndicator.asDriver()
        
        sectionInfo = tap.asObservable().flatMapLatest {_ in
            return APIManager.getEventsObservable().map { element in
                guard let elm = element else {
                    return []
                }
                return [SectionOfMyEventDetail(header: "", items: elm.events)]
            }.trackActivity(activityIndicator)
        }.asDriver(onErrorJustReturn: [])
    }
    
}
