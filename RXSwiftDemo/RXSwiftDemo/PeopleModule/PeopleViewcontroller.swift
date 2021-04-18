//
//  PeopleViewcontroller.swift
//  RXSwiftDemo
//
//  Created by 16 Macbook Pro on 2021/4/18.
//  Copyright © 2021 CodeText.Organization. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class PeopleViewcontroller: ViewController {
    
    let peopleList = PeopleListModel()
    let disposeBag = DisposeBag()
    let peopleListTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleList.data.bind(to: peopleListTableView.rx.items(cellIdentifier: "peopleTable")){_,model,cell in
            cell.textLabel?.text = model.name
            cell.detailTextLabel?.text = String(model.age)
        }.disposed(by: disposeBag)
        
        
        peopleListTableView.rx.modelSelected(PeopleListModel.self).subscribe(onNext:{ people in
            print("")
            }).disposed(by: disposeBag)
        
        peopleListTableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
             print("\(indexPath.row)")
            }).disposed(by: disposeBag)
    }
}
