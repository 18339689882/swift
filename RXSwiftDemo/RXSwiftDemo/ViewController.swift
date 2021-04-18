//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by 16 Macbook Pro on 2021/4/18.
//  Copyright © 2021 CodeText.Organization. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
    // MARK:// RXCocoa swift 常用控件的一些扩展
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let disposeBag = DisposeBag()
        
        let button = UIButton()
        button.rx.tap.subscribe(onNext: { (button) in
            print("按钮点击了")
        }).disposed(by: disposeBag)
        let textField = UITextField()
        // 传统。
        // textField.delegate = self;
        
        textField.rx.text.subscribe(onNext: { (text) in
            print(text as Any)
        }).disposed(by: disposeBag)
        // warning todo !!
        textField.rx.text.subscribe { (event) in
            print(event.element!!)
        }.disposed(by: disposeBag)
        
        // textField 的值绑定到label
        let label = UILabel()
        // ObserverType 协议
        // textField.rx.text.bind(to: ObserverType)
        /*
         public protocol ObserverType {
         /// The type of elements in sequence that observer can observe.
         associatedtype Element
         
         /// Notify observer about sequence event.
         ///
         /// - parameter event: Event that occurred.
         func on(_ event: Event<Element>)
         }
         */
        textField.rx.text.bind(to: label.rx.text).disposed(by: disposeBag)
        // KVO
        #warning("KVO")
        label.rx.observe(String.self, "text").subscribe(onNext: { (text) in
            print("\(text ?? "")")
        }).disposed(by: disposeBag)
        
        
        // scrollView 的滚动
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize.init(width: self.view.frame.size.width, height: UIScreen.main.bounds.size.height)
        scrollView.rx.contentOffset.subscribe(onNext: { (point) in
            print(point.x)
        }).disposed(by: disposeBag)
    }
}


extension ViewController : UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("点击了textField")
//        return true
//    }
}
