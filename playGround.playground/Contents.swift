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

//元组的分解
//let error = (1, "没有权限")
//let (errorCode, errorMsg) = error
//print(errorCode,errorMsg)

//元组作为函数的返回值
//func writeFile(content:String) ->(errorCode:Int, errorMsg: String){
//    return(1, "没有权限")
//}
//
//let error = writeFile(content: "")
//print(error)
//
//// Optional
//var str: String? = "abc"

let emptyStr = ""
if emptyStr.isEmpty{
    print("empty")
}

let numbers = """
    1
    2
        3
    4
    5
    """
print(numbers)


