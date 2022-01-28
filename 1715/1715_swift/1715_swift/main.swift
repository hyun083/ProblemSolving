//
//  main.swift
//  1715_swift
//
//  Created by Hyun on 2022/01/27.
//

import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var total = 0

for _ in 1...N{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: >)

while arr.count > 1{
    let temp = arr.removeLast()
    arr[arr.count - 1] += temp
    total += arr.last!
    arr.sort(by: >)
}

if N == 1{
    print("0")
}else{
    print(total)
}
