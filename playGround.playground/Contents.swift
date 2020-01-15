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

func getNumber() -> Int{
    print("aaa")
    return 8
}

let a: Int? = nil
let b = "abc"
print(a ?? getNumber())

