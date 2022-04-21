//
//  main.swift
//  2338_swift
//
//  Created by Hyun on 2022/04/21.
//

import Foundation

func plus(num1:[Int], num2:[Int]) -> [Int]{
    var result = [Int]()
    var num1 = Array(num1.reversed())
    var num2 = Array(num2.reversed())
    var carry = 0
    if num1.count > num2.count{
        for _ in 0..<num1.count - num2.count{
            num2.append(0)
        }
    }else{
        for _ in 0..<num2.count - num1.count{
            num1.append(0)
        }
    }
    for i in 0..<num2.count{
        result.append((carry+num1[i]+num2[i])%10)
        carry = (carry+num1[i]+num2[i])/10
    }
    if carry != 0 {
        result.append(carry)
    }
    
    return Array(result.reversed())
}
func minus(num1:[Int], num2:[Int]) -> [String]{
    if num1 == [0]{
        return ["-"+num2.map{String($0)}.joined()]
    }
    var result = [String]()
    var num1 = Array(num1.reversed())
    var num2 = Array(num2.reversed())
    
    if num1.count > num2.count{
        for _ in 0..<num1.count-num2.count{
            num2.append(0)
        }
    }else{
        for _ in 0..<num2.count-num1.count{
            num1.append(0)
        }
    }
    for i in 0..<num2.count{
        var number = num1[i]-num2[i]
        if number < 0 {
            if i == num2.count-1{
                result.append(String(abs(number)))
                result.append("-")
            }else{
                number += 10
                result.append(String(number))
                num1[i+1] -= 1
            }
        }else{
            result.append(String(number))
        }
    }
    if result.count>1 && result.last! == "0"{
        result.removeLast()
    }
    return Array(result.reversed())
}

func multi(num1:[Int], num2:[Int]) -> [String]{
    if num1==[0] || num2==[0]{
        return ["0"]
    }
    var result = [0]
    let num1 = Array(num1.reversed())
    let num2 = Array(num2.reversed())
    var temp = [[Int]]()
    
    for i in num2{
        var carry = 0
        var tempResult = [Int]()
        for k in num1{
            let n = i*k+carry
            tempResult.append(n%10)
            carry = n/10
        }
        if carry != 0 {
            tempResult.append(carry)
        }
        temp.append(Array(tempResult.reversed()))
    }
    var blank = [0]
    for i in 0..<temp.count{
        if i>0{
            let t = temp[i]+blank
            blank.append(0)
            result = plus(num1: result, num2: t)
        }else{
            result = plus(num1: result, num2: temp[i])
        }
    }
    return result.map{String($0)}
}

var A = readLine()!
var B = readLine()!

if A.contains("-") && B.contains("-"){
    A.removeFirst()
    B.removeFirst()
    let tempA = A.map{Int(String($0))!}
    let tempB = B.map{Int(String($0))!}
    print("-"+plus(num1: tempA, num2: tempB).map{String($0)}.joined())
    print(minus(num1: tempB, num2: tempA).joined())
    print(multi(num1: tempA, num2: tempB).joined())
}else if A.contains("-") && !B.contains("-"){
    A.removeFirst()
    let tempA = A.map{Int(String($0))!}
    let tempB = B.map{Int(String($0))!}
    print(minus(num1: tempB, num2: tempA).joined())
    print("-"+plus(num1: tempA, num2: tempB).map{String($0)}.joined())
    print("-"+multi(num1: tempA, num2: tempB).joined())
}else if !A.contains("-") && B.contains("-"){
    B.removeFirst()
    let tempA = A.map{Int(String($0))!}
    let tempB = B.map{Int(String($0))!}
    print(minus(num1: tempA, num2: tempB).joined())
    print(plus(num1: tempA, num2: tempB).map{String($0)}.joined())
    print("-"+multi(num1: tempA, num2: tempB).joined())
}else if !A.contains("-") && !B.contains("-"){
    let tempA = A.map{Int(String($0))!}
    let tempB = B.map{Int(String($0))!}
    print(plus(num1: tempA, num2: tempB).map{String($0)}.joined())
    print(minus(num1: tempA, num2: tempB).joined())
    print(multi(num1: tempA, num2: tempB).joined())
}

