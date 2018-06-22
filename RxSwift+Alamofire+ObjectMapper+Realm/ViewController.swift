//
//  ViewController.swift
//  RxSwift+Alamofire+ObjectMapper+Realm
//
//  Created by 今枝 稔晴 on 2018/06/22.
//  Copyright © 2018年 iXIT Corporation. All rights reserved.
//

import UIKit
import SVProgressHUD
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    var viewModel: ViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // prepare for viewmodel
        viewModel = ViewModel(tap: refreshButton.rx.tap)
        viewModel?.sectionInfo.drive(onNext: { info in
            dump(info)
        }).disposed(by: disposeBag)
        
        // tableview datasource
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfMyEventDetail>(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
            let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "DefaultCell")
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.catch
            return cell
        })
        viewModel?.sectionInfo.asObservable().bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        // loading
        viewModel?.isLoading.drive(onNext: { isLoading in
            if isLoading {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }).disposed(by: disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
