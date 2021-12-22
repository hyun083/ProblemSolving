//
//  main.swift
//  1629_swift
//
//  Created by Hyun on 2021/12/21.
//

import Foundation

let numbers = readLine()!.split(separator: " ").map{UInt64(String($0))!}

let A = numbers[0]
var B = numbers[1]
let C = numbers[2]

func p(num1:UInt64, num2:UInt64) -> UInt64{
    if num2 == 0{
        return UInt64(1)
    }else if num2 == 1{
        return num1
    }
    
    //홀수일경우
    if num2 % 2 > 0{
        return p(num1: num1, num2: num2-1)*num1
    }
    
    //짝수일경우 모듈러공식 (a * b) mod n = ((a mod n) * (b mod n)) mod n
    var half = p(num1: num1, num2: num2/2)
    half %= C
    return (half*half)%C
}

print(p(num1: A, num2: B)%C)

