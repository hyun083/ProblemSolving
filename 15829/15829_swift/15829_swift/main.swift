//
//  main.swift
//  15829_swift
//
//  Created by Hyun on 2021/11/23.
//

import Foundation

let L = Int(readLine()!)!
let inputs = readLine()!
var arr = Array<Int>()
var sum = 0
let M = 1234567891
var r = 1

for i in inputs{
    arr.append(Int(i.asciiValue! - 96))
}

for idx in arr.indices{
    sum += arr[idx] * r % M
    r *= 31
    r %= M
}

print(sum % M)
