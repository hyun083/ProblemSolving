//
//  main.swift
//  12871_swift
//
//  Created by Hyun on 2022/01/19.
//

import Foundation

let F = readLine()!
let S = readLine()!
var f = ""
var s = ""

func gcd(num1:Int, num2:Int) -> Int{
    if num2 == 0{
        return num1
    }else{
        return gcd(num1: num2, num2: num1 % num2)
    }
}

func LCM(num1:Int, num2:Int) -> Int{
    return num1 * num2 / gcd(num1: num1, num2: num2)
}

let ans = LCM(num1: F.count, num2: S.count)

for _ in 0..<ans/F.count{
    f += F
}

for _ in 0..<ans/S.count{
    s += S
}

let result = f==s ? "1":"0"
print(result)
