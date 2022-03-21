//
//  main.swift
//  12852_swift
//
//  Created by Hyun on 2022/03/20.
//

import Foundation
var N = Int(readLine()!)!

var dp = Array(repeating: -1, count: N+1)
var numbers = Array(repeating: -1, count: N+1)

func one(number:Int) -> Int{
    if number == 1{
        return 0
    }
    if dp[number] != -1{
        return dp[number]
    }
    
    var temp = one(number: number - 1) + 1
    numbers[number] = number-1
    
    if number % 3 == 0 && temp > one(number: number/3) + 1{
        temp = one(number: number/3) + 1
        numbers[number] = number/3
    }
    if number % 2 == 0 && temp > one(number: number/2) + 1{
        temp = one(number: number/2) + 1
        numbers[number] = number/2
    }
    dp[number] = temp
    
    return temp
}
print(one(number: N))
while N != -1{
    print(N,terminator: " ")
    N = numbers[N]
}

print(dp)
print(numbers)
