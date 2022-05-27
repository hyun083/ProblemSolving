//
//  main.swift
//  3273_swift
//
//  Created by Hyun on 2022/05/26.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let target = Int(readLine()!)!

var cnt = 0
var start = 0
var end = n-1
while start < end{
    let temp = arr[start] + arr[end]
    if temp == target{
        cnt += 1
        start += 1
        end -= 1
    }
    if temp < target{
        start += 1
    }
    if temp > target{
        end -= 1
    }
}
print(cnt)
