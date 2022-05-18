//
//  main.swift
//  15740_swift
//
//  Created by Hyun on 2022/05/18.
//

import Foundation

func plus(num1:String, num2:String) -> String{
    var result = ""
    
    var num1 = num1.reversed().map{String($0)}
    var num2 = num2.reversed().map{String($0)}
    
    if num1.count > num2.count{
        for _ in 0..<num1.count-num2.count{
            num2.append("0")
        }
    }else{
        for _ in 0..<num2.count-num1.count{
            num1.append("0")
        }
    }
    var carry = Int8(0)
    for i in 0..<num1.count{
        let temp = Int8(num1[i])! + Int8(num2[i])! + carry
        carry = temp/10
        result.append(String(temp%10))
    }
    if carry != 0 {
        result.append(String(carry))
    }
    
    return String(result.reversed())
}
let line = readLine()!.split(separator: " ").map{String($0)}
let A = line[0]
let B = line[1]
print(plus(num1: A, num2: B))
