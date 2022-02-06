//
//  main.swift
//  1252_swift
//
//  Created by Hyun on 2022/02/05.
//

import Foundation

let numbers = readLine()!.split(separator: " ").map{String($0)}
var num1 = [Int]()
var num2 = [Int]()
var result = [Int]()

for n in numbers[0]{
    num1.append(Int(String(n))!)
}
for n in numbers[1]{
    num2.append(Int(String(n))!)
}

num1 = num1.reversed()
num2 = num2.reversed()

if num1.count < num2.count{
    for _ in 1...num2.count-num1.count{
        num1.append(0)
    }
}else if num1.count > num2.count{
    for _ in 1...num1.count-num2.count{
        num2.append(0)
    }
}

var carry = 0

for i in 0..<num1.count{
    let command = num1[i] + num2[i] + carry
    if command == 0{
        result.append(0)
        carry = 0
    }else if command == 1{
        result.append(1)
        carry = 0
    }else if command == 2{
        result.append(0)
        carry = 1
    }else{
        result.append(1)
        carry = 1
    }
}
if carry == 1{
    result.append(1)
}

if result.reduce(0, +) == 0{
    print(0)
}else{
    var flag = false
    for r in result.reversed(){
        if r == 1{
            flag = true
        }
        if flag{
            print(r,terminator: "")
        }
    }
}
