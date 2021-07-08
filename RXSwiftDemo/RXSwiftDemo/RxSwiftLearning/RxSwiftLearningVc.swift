//
//  RxSwiftLearningVc.swift
//  RXSwiftDemo
//
//  Created by sws on 2021/7/8.
//  Copyright © 2021 CodeText.Organization. All rights reserved.
//

import Foundation
import RxSwift

class RxSwiftLearningVc: ViewController {
    
    fileprivate lazy var disposeBagLearning = DisposeBag()
    
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        // MARK:
        // MARK:常用的操作符
        // MARK:
        print("-----------------RxSwiftLearningVc---------------------")
        /// 参考链接：https://www.tyrad.cc/wiki/swift/rxswift-base-operator/
        // MARK: Observable 理解
        /**
         let observable = Observable.of("1", "2", "3").map{
             Int($0)
         }.filter{
             if let item = $0, item > 0{
                 print("xxxx:\(item)") // 被订阅后才会被真正执行
                             return true
             }
             return false
         }
         
         observable.subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         */
        
        // MARK: Create 当需要精确控制发送给订阅者的成功、失败等，就需要用到 Observable 的 create 方法。
        
        let create = Observable<Int>.create { obe -> Disposable in
            obe.onNext(10)
            obe.onError(NSError())
            obe.onCompleted()
            return Disposables.create()
        }
        
        create.subscribe(onDisposed: {
            
        }).disposed(by: disposeBagLearning)
        
        let tasks = PublishSubject<String>()
        
        // MARK: 1. ignoreElements 忽略掉所有的.next 事件，只接受.completed 事件
        /**
         tasks.ignoreElements().subscribe{
             print("ignoreElements\($0)")
         }.disposed(by: disposeBagLearning)

         tasks.subscribe(onNext: {
             print("onNext \($0)")
         }).disposed(by: disposeBagLearning)
         */
        
        // MARK: 2. skip(n) 忽略前 n 个信号
        /**
         tasks.skip(3).subscribe{
             print("skip \($0)")
         }.disposed(by: disposeBagLearning)
         */
        
        // MARK: 3. skipWhile 当遇到第一个不满足条件的事件之后，就不再忽略任何事件了
        /**
         tasks.skip {
             $0 == "0"
         }.subscribe{
             print("skip(while \($0)")
         }.disposed(by: disposeBagLearning)
         可以收到 1 2 和 onCompleted 事件
         */
        
        // MARK: 4. skipUntil
        /**
         let nutilSubject = PublishSubject<Void>()
         tasks.skip(until: nutilSubject)
                         .subscribe { print($0) }
                         .disposed(by: disposeBagLearning)
         
         tasks.onNext("0")
         nutilSubject.onNext(())
         tasks.onNext("1")
         tasks.onNext("2")
         tasks.onCompleted()
         // next(1)
         // next(2)
         // completed
         */
        
        // MARK: 5. distinctUntilChanged 忽略序列中连续重复的事件
        /**
         tasks.distinctUntilChanged().subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         
         tasks.onNext("0")
         tasks.onNext("0")
         tasks.onNext("1")
         tasks.onNext("1")
         tasks.onNext("2")
         tasks.onNext("2")
         tasks.onCompleted()
         */
        
        // MARK: 6. elementAt(n) 取下标为 n 的元素
        /**
         tasks.element(at: 2).subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         */
        
        // MARK: ‼️ 7. filter 筛选next事件
        /**
         tasks.filter{
             $0 != ""
         }.subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         */
        // MARK: 8. take(n) 取前n个
        /**
         tasks.take(2).subscribe{ // 取前两个
             print($0)
         }.disposed(by: disposeBagLearning)
         */
        // MARK: 9.takeLast(count) 取倒数count个
        /**
         tasks.takeLast(2).subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         */
        // MARK: 10. takeWhile 只要条件为 true 就一直订阅下去”这样的概念
        /**
         tasks.take(while: {
             $0 == "1"
         }).subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         */
        // MARK: 10. takeUntil 发生之前一直订阅，条件为另外一个信号，与skip相反
        /**
         let takeUntilSubject = PublishSubject<Int>()
         tasks.take(until: takeUntilSubject).subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         tasks.onNext("0")
         tasks.onNext("1")
         takeUntilSubject.onNext(1)
         tasks.onNext("2")
         tasks.onCompleted()
         // 0, 1
         */
        
        // MARK: 11.toArray 把事件打包成Array
        /**
         Observable.of(1,2,3).toArray().subscribe(onSuccess: { arr in
             print(arr) /// [1, 2, 3]
         }, onFailure: { error in
             
         }, onDisposed: {
             
         }).disposed(by: disposeBagLearning)
         tasks.toArray().subscribe{
             print($0) // success(["0", "1", "2"])
         }.disposed(by: disposeBag)
         tasks.onNext("0")
         tasks.onNext("1")
         tasks.onNext("2")
         tasks.onCompleted()
         */
        // MARK: 12. scan
        // MARK:‼️🇨🇳 13. map {中可以添加一些表达式，返回的结果类型 与 in 之后的类型一致}
        /**
         Observable.of(1,2,3)
             .map{
                 value in value > 1
             }.subscribe{
                 print($0)
             }.disposed(by: disposeBagLearning)
             //        next(false)
             //        next(true)
             //        next(true)
             //        completed
         
         tasks.map{
             value in value + "map"
         }.subscribe{
             print($0)
         }.disposed(by: disposeBagLearning)
         tasks.onNext("0")
         tasks.onNext("1")
         tasks.onNext("2")
         tasks.onCompleted()
         // next(0map)
         // next(1map)
         // next(2map)
         // completed
         */
        // MARK:🇨🇳 14. flatMap / flatMapLast 没有理解 ❓❓❓❓
        /**
         let flatMapSubject = PublishSubject<Observable<NSString>>.init()
         flatMapSubject.flatMap{
             $0
         }.subscribe(onNext: {
             print($0)
         }).disposed(by: disposeBagLearning)
         flatMapSubject.onNext(Observable.of("1"))
         */
    }
}
