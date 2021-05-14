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
    
    let viewModel = PeopleVieModel()
    let peopleList = PeopleListModel()
    let disposeBag = DisposeBag()
    let peopleListTableView = UITableView.init(frame: CGRect(x: 15, y: 160, width: 200, height: 200), style: .plain)
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        peopleListTableView.backgroundColor = UIColor.gray
        self.view.addSubview(peopleListTableView)
        peopleListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "peopleTable")
        
        viewModel.dataObservable.bind(to: peopleListTableView.rx.items(cellIdentifier: "peopleTable")){ row, people, cell in
            cell.textLabel?.text = people.name
            cell.detailTextLabel?.text = "\(people.age)"
        }.disposed(by: disposeBag)
        
        peopleListTableView.rx.modelSelected(People.self).subscribe(onNext: { (people :People) in
            print(people.name)
        }).disposed(by: disposeBag)
        
        peopleListTableView.rx.itemSelected.subscribe { (indexPath) in
            print(indexPath)
        }.disposed(by: disposeBag)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            viewModel.dataObservable.onNext([People(name: "hahah", age: 15)])
        }
    }
}
