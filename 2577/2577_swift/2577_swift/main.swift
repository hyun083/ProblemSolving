//
//  main.swift
//  2577_swift
//
//  Created by Hyun on 2022/12/02.
//

import Foundation

var sum = 1
var numbers = Array(repeating: 0, count: 10)

for _ in 0..<3{
    sum *= Int(readLine()!)!
}

while sum > 0{
    numbers[sum%10] += 1
    sum /= 10
}
for i in 0..<10{
    print(numbers[i])
}

