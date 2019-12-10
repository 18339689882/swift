//
//  ViewController.swift
//  SHswift
//
//  Created by dchip on 2019/12/10.
//  Copyright © 2019 Dchip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let maximumNumberOfLoginAttempts = 10
        var currentLoginAttempt = 0
        
        var x = 0.0, y = 0.0, z = 0.0
        
        var weclomeMessage: String
        weclomeMessage = "swift"
        
        var red, blue, green: Double
        
        //常量和变量名可以包含任何字符
        let π = 3.14159
        let 你好 = "你好世界"
        let 🐶🐮 = "dogcow"
        
        //变量值可以改变
        var friendlyWelcome = "Hello!"
        friendlyWelcome = "Bonjour!"
        // friendlyWelcome 现在是 "Bonjour!"
        
        //常量则不行
        let friendlyWelcome1 = "Hello!"
//        friendlyWelcome1 = "Bonjour!"（报错）
        
        //输出
        print(friendlyWelcome1)
        
        //变量或者常量输出。类似于oc NSLog(@"%@", friendlyWelcome)
        print("The current value of friendlyWelcome is \(friendlyWelcome)")
        // 输出“The current value of friendlyWelcome is Bonjour!”
        
        //分号 可以不加， 一行写多个语句，必须加分号。
        let cat = "🐱"; print(cat)
        // 输出“🐱”
    }


}

