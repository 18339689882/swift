import UIKit

//let maxNumber = 10
//var currentNum = 20
//
////maxNumber = 5  //常量不能直接赋值。报错
//
//currentNum = 1 //变量可以赋值。
//
//// 一行定义多个常量 或者变量
//let x = 0.0, y = 0.0, z = "123"
//
//print("x = \(x), y =\(y), z = \(z)")
//
//let ab = "abc"
//
////Tuple 元组，OC是没有的 元组创建之后 不能改变
//let error = (1, "没有权限")
//
//print(error.0)
//print(error.1)

//let error = (errorCode: 1, errorMessage: "没有权限")
//
//print(error.errorCode)
//print(error.errorMessage)


//var error = (errorCode: 1, errorMsg: "无权限")
//
//error.errorCode = 2
//print(error)
//error.errorMsg = 3 //报错

//var error:(errorCode:Int, errorMsg:Any) = (errorCode: 1,errorMsg: "无权限")
//error.errorCode = 2
//error.errorMsg = 3 //不会报错
//print(error)
//
////元组的分解
//let error1 = (1, "没有权限")
//let (errorCode, errorMsg) = error
//print(errorCode,errorMsg)
//
////元组作为函数的返回值
//func writeFile(content:String) ->(errorCode:Int, errorMsg: String){
//    return(1, "没有权限")
//}
//
//let error2 = writeFile(content: "")
//print(error)
////
////// Optional
////var str: String? = "abc"
//
//let emptyStr = ""
//if emptyStr.isEmpty{
//    print("empty")
//}
//
//let numbers = """
//    1
//    2
//        3
//    4
//    5
//    """
//print(numbers)


//let i = 1
//if i == 1 {
//    print(i)
//}
////MARK: 初始化字符串
////字面量 推算
//var emptyString = "some string"
////初始化器语法；
//var anotherStr = String();
//if anotherStr .isEmpty {
//    print("empsyString");
//}

//
//var welcome = "hello"
//var welcome1 = welcome
//welcome1 += "word"
//
//print(welcome == welcome1)
//
//var string1 = "我是"
//var string2 = "中国人"
//let str = string1 + string2
////print(str)

//var welcome = "hello"
////字符串的索引
//welcome.insert("!", at: welcome.endIndex)//插入字符串！
//welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))//插入字符串在！和 hello之间
//welcome.remove(at: welcome.index(before: welcome.endIndex))//移除！
//
//let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
//welcome.removeSubrange(range)
//print(welcome)//移除固定范围字符串

//字符串比较
//let welcome = "hello, world"
//let index = welcome.firstIndex(of: ",") ?? welcome.endIndex //不存在就去最后一位
//let subString = welcome[..<index] //区间运算符
//print(subString)
//
//let newString = String(subString)
//print(newString)
//
//let welcomt1 = "hello"
//print(welcome == welcomt1)
//print(welcome.hasPrefix("hello"))//取前缀
//print(welcome.hasSuffix("world"))//取后缀
//print(welcomt1.hasSuffix("world"))//取后缀

//
//var num1: UInt8 = 251
//var num2 = num1 &+ 20
//print(num2)

//var num1: UInt8 = 0
//var num2 = num1 &- 1
//print(num2)

//-128 ~ 127
//var num1: Int8 = -128
//var num2 = num1 &- 1
//print(num2) // 127

//合并空值运算符
//let a:Int? = nil //可选值
//let b = 8
//print(a ?? b)

//隐式展开
//let str:String! = "abc"
//let count = str.count
//print(count)

//可选链
//let str:String? = "abc"
//let scount = str?.count
//if scount != nil{
//    let lastIndex = scount! - 1
//    print(lastIndex)
//}

//func getNumber() -> Int{
//    print("aaa")
//    return 8
//}
//
//let a: Int? = nil
//let b = "abc"
//print(a ?? getNumber())

// 位运算
let number :Int8 = -8
//print(~number)
//print(number & 0)
//print(number | 0)
//print(number ^ 3)
//print(number << 1)
//print(number >> 1)


//异或算法1
//var a = 10
//var b = 8
//
//a = a ^ b
//
//b = a ^ b
//a = a ^ b
//
//func countOffones (num:UInt) -> UInt{
//    var count:UInt = 0
//    var temp = num
//    while temp != 0 {
//        count += (temp & 1)
//        temp = temp >> 1
//    }
//    return count
//}
//
//countOffones(num: 0x111010000)

//// 定义中缀运算级
//infix operator += : AdditionPrecedence
//infix operator *^ :MyPrecedence
//// 定义优先级
//precedencegroup MyPrecedence{
//    associativity:left
//    lowerThan:AdditionPrecedence
//}
//// 定义结构体
//struct Vector2D{
//    var x = 0.0
//    var y = 0.0
//}
//// 自定义运算符
//extension Vector2D {
//    static func *^ (left: Vector2D, right: Vector2D) -> Vector2D {
//        return Vector2D(x: left.x * right.x, y: left.y * right.y)
//    }
//}
//extension Vector2D {
//    static func += (left: Vector2D, right: Vector2D) -> Vector2D {
//        return Vector2D(x: left.x + right.x, y: left.y + right.y)
//    }
//}
//// 计算结果
//let first = Vector2D(x: 10, y: 8)
//let second = Vector2D(x: 2, y: 2)
//let third = Vector2D(x: 2, y: 2)
//let result = first += second *^ third

let numverOfLegs = ["one":8,"tow":7,"three":6]

//for (a, b) in numverOfLegs {
//    print("\(a) to \(b)")
//}

//for t in numverOfLegs {
//    print("\(t.0) to \(t.1)")
//}


//let base = 3
//let power = 5
//var result = 1
//for _ in 1...3 {
//    result *= base
//    print("\(base) to \(power) is \(result)")
//}
//
//let minuteInterval = 5
//for tickMark in stride(from: 0, to: 50, by: minuteInterval) {//不包含50
//    print(tickMark)
//}
//for tickMark in stride(from: 0, through: 50, by: minuteInterval) {//包含50
//    print(tickMark)
//}

//let someCharacter:Character = "z"
//switch someCharacter {
//case "a":
//    print("")
//case "b":
//    print("b")
//default:
//    print("z")
//}
//
//let somePoint = (1, 1)
//
//switch somePoint {
//case let (x, y) where x == -y :
//    print("\(x)")
//case let (x, y) where x > y :
//    print("\(y)")
//case let (x, y) where x == y :
//    print("\(x) and \(y)")
//case let(x, y):
//    print("\(x) and \(y)")
//}
//
//if #available(iOS 10, mascOS 10.12 *){
//
//}

//let array = [1, 2, 3]
//let arr:[Int] = []
//// 初始化器
//var arr1 = [Int]()
//var arr2 = Array<String>()
//
//// 初始化器参数
//let five = Array(repeating: "a", count: 5)
//print(five);
//
//let four = Array(arrayLiteral: 1...3)
//print(four)
//
//let numbers = [Int](0...7)
//print(numbers)
//
//let persons = ["zhangsan":24, "lisi":12]
//let names = [String](persons.keys)
//print(names)


//let arr = [Int](0...8)
//for (index, num) in arr.enumerated() {
//    print("***\(index)")
//    print(num * 10)
//}


//var numIterator = arr.makeIterator()
//while let num = numIterator.next(){
//    print(num * 10)
//}
//let arr = [Int](0...8)
//print(arr.startIndex)// 0
//print(arr.endIndex)// 9
//
//print(arr.indices)// 0..<9
//
//print(arr.makeIterator())

var array = [10, 20, 30, 50, 80]
print(array.allSatisfy({$0 > 10}))// false
print(array.allSatisfy({$0 >= 10}))// ture
