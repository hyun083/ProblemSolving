//
//  main.swift
//  1463_swift
//
//  Created by Hyun on 2021/12/16.
//

import Foundation

let N = Int(readLine()!)!

var dp = Array(repeating: -1, count: N+1)

func one(number:Int) -> Int{
    if number == 1 {
        return 0
    }
    if dp[number] != -1 {
        return dp[number]
    }
    
    var temp = one(number: number - 1) + 1
    
    if number % 3 == 0 {
        temp = min(temp, one(number: number/3) + 1)
    }
    if number % 2 == 0{
        temp = min(temp, one(number: number/2) + 1)
    }
    dp[number] = temp
    return temp
}
print(one(number: N))

