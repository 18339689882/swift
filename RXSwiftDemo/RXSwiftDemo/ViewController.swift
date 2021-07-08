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
    // 有类型的数组
    fileprivate lazy var heros : [ViewController] = [ViewController]()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            print(event.element as Any)
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
        /**
         
         */
        print("------------------------------")
        // MARK:
        // MARK:资源释放
        // MARK:
        let subject = BehaviorSubject(value: "1")
        // _ = 消除警告，忽略返回值
        /**
         此对象不会随便销毁
         销毁方式：
         1.   .dispose()直接销毁  2不会打印，
         2.   .disposed(by: disposeBag) disposeBag 对象销毁的时候销毁。
            可以使用fileprivate，跟随文件这个类的销毁，才销毁。
         */
        
        subject.subscribe { (event: Event<String>) in
            print(event)
        }.disposed(by: disposeBag)
        subject.onNext("2")
        
        // MARK:UIBindingObserver
        addTouchButton()
        self.navigationController?.pushViewController(RxSwiftLearningVc(), animated:true)
    }
    
    fileprivate func addTouchButton() {
        view.addSubview(touchButton)
        touchButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100);
        touchButton.backgroundColor = .cyan
        touchButton.setTitle("rxSwift learning", for: .normal)
        touchButton.rx.tap.subscribe(onNext: { (button) in
            self.navigationController?.pushViewController(RxSwiftLearningVc(), animated:true)
        }).disposed(by: disposeBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // self.present(PeopleViewcontroller.init(), animated: true, completion: nil)
    }
    
    private lazy var touchButton: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
}

extension ViewController{
    fileprivate func createTableView(){
        // MARK:UItableView 使用
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        /**
         1， 设置代理
         2， 新数据，就需要reloadData
         */
        // rxSwift tableView
        /**
         
         */
    }
}

extension ViewController : UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("点击了textField")
//        return true
//    }
}
