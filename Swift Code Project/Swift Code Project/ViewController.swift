//
//  ViewController.swift
//  Swift Code Project
//
//  Created by sws on 2020/12/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 闭包学习
        learnSwiftBlockAction()
        // async/await
        asyncAwaitLearnAction()
    }
}

extension ViewController{
    //_____________________________________________________闭包_______________________________________________________________
    func learnSwiftBlockAction() {
        //MARK:闭包
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        func backward(_ s1:String, _ s2:String) -> Bool {
            return s1 > s2
        }
        
        var sortedNames = names.sorted(by: backward)
        
        print(sortedNames)
        //闭包写法
        sortedNames = names.sorted(by: {(s1:String, s2:String) -> Bool in
            return s1 > s2
        })
        
        // 根据上下文推断类型 简写 省略了参数类型 和 返回值类型
        /// 实际上，通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型。
        // 完整格式的闭包能够提高代码的可读性
        sortedNames = names.sorted(by: {s1, s2 in return s1 > s2})
        // 单行表达式闭包 隐式返回
        sortedNames = names.sorted(by: {s1, s2 in s1 > s2})
        // 参数名称缩写
        sortedNames = names.sorted(by: {$0 > $1})
        // 运算符方法
        sortedNames = names.sorted(by: >)
        print(sortedNames)
        
        
        //MARK:尾随闭包调用？？ 只是调用的时候显示不一样？？？
        // 需求：将一个很长的闭包表达式作为参数传递给函数
        func someFunctionMoreLongExpression(closure:() -> Void){
            
        }
        // sorted方法 尾随包的形式调用
        sortedNames = names.sorted(){
            $0 > $1
        }
        // 闭包表达式是唯一参数，可以省略（）
        sortedNames = names.sorted{
            $0 > $1
        }
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        // map描述尾随闭包的好用之处
        let strings = numbers.map{
            (number) -> String in
            var number = number
            var output = ""
            repeat{
                output = digitNames[number % 10]! + output
                number /= 10
            }while number > 0
            return output
        }
        print(strings)
        //效果；通过尾随闭包语法，优雅地在函数后封装了闭包的具体功能，而不再需要将整个闭包包裹在 map(_:) 方法的括号内。
        
        // MARK:值捕获需要再品品 $$$$$$$
        // 内存优化点，为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝。Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。
        
        //MARK: 闭包引起的循环强引用。!!!!!!!!!
        
        //MARK:逃逸闭包 @escaping
        /**
         定义：当一个闭包作为参数传到一个函数中，但是这个闭包在  **函数返回之后**  才被执行，我们称该闭包从函数中逃逸
         理解：闭包可能在函数结束后被调用（接口数据返回）
         */
        
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // 打印出“5”
        
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // 打印出“5”
        
        print("Now serving \(customerProvider())!")
        // 打印出“Now serving Chris!”
        print(customersInLine.count)
        // 打印出“4”
    }
    //_____________________________________________________async/await_______________________________________________________________
    //MARK:  认识 Swift 中的异步与并发 https://xiaozhuanlan.com/topic/8627905413
    fileprivate func asyncAwaitLearnAction() throws {
        
    }
    
    func fetchThumbnail(for id: String) async throws -> UIImage {
        let request = thumbnailURLRequest(for: id)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badID }
        let maybeImage = UIImage(data: data)
        guard let thumbnail = await maybeImage?.thumbnail else { throw FetchError.badImage }
        return thumbnail
    }
    
    private func raiseHand() throws -> Bool {
        return true
    }
}

extension Double{
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

protocol playerControlProtocol {
    var videoView :Int {get set}
//    var some: Int{get}
//    // 类属性
//    static var someTypeProperty: Int { get set }
    func startPlayMethod(vid:Int)
}

extension playerControlProtocol{
    
}
