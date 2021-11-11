//
//  main.swift
//  10816_swift
//
//  Created by Hyun on 2021/11/11.
//

import Foundation

var numbers = Array(repeating: 0, count: 20000001)

let N = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map{Int(String($0))!}
for number in cards{
    numbers[number+10000000] += 1
}

let M = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
for m in arr{
    print(numbers[m+10000000],terminator: " ")
}

