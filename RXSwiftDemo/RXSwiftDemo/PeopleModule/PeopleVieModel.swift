//
//  PeopleVieModel.swift
//  RXSwiftDemo
//
//  Created by 16 Macbook Pro on 2021/4/18.
//  Copyright © 2021 CodeText.Organization. All rights reserved.
//

import Foundation
import RxSwift

struct PeopleListModel {
    let data = Observable.just([
        People(name: "赵蒙蒙", age: 18),
        People(name: "赵蒙蒙1", age: 19),
        People(name: "赵蒙蒙2", age: 20),
        People(name: "赵蒙蒙3", age: 21),
    ])
}

class PeopleVieModel: NSObject {
    
}
