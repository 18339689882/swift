import UIKit

var str = "Hello, playground"
// 函数
func addTwoNum(_ first:Int, _ twoNum:Int) -> Int{
    return first + twoNum
}

addTwoNum(10, 20)
// 函数默认参数
func addTwo1Num(_ first:Int, _ twoNum:Int = 10) -> Int{
    return first + twoNum
}
addTwo1Num(10)
// 数组函数
func addNumbs(nums:Int...) -> Int{
    var sum = 0
    for num in nums {
        sum += num
    }
    return sum
}
addNumbs(nums: 3,4,5)

//输入输出函数
var a = 10
var b = 20
func changeNum(_ a: inout Int, _ b: inout Int){
    let tem = a
    a = b
    b = tem
}
//changeNum(&a, &b)
//print("a = \(a) b = \(b)")

// MARK: - 函数类型定义常量/ 变量

let swapFunc :(inout Int, inout Int) -> () = changeNum
swapFunc(&a,&b)
print("a = \(a) b = \(b)")

// MARK: - 函数类型作为形式参数
func printMasonry(_ mathFunc:(Int, Int) -> Int,a:Int, b:Int){
    print(mathFunc(a, b))
}
printMasonry(addTwoNum, a: 10, b: 1)

// MARK: - 函数类型作为返回类型

// MARK: - 内嵌函数。可以在函数的内部定义另外一个函数
func chooseStepFunc(back:Bool) -> (Int) -> Int{
    func step1(input:Int) -> Int {return input + 1}
    func step2(input:Int) -> Int {return input - 1}
    return back ? step1 : step2
}

var number = -1
let curretnNum = chooseStepFunc(back: number < 0)
print("num = \(curretnNum(number))")


