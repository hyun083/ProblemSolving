//
//  main.swift
//  1940_swift
//
//  Created by Hyun on 2023/01/11.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: {$0 < $1})

var s = 0
var e = n-1
var cnt = 0

while s<e{
    let sum = arr[s] + arr[e]
    if sum > m{
        e -= 1
    }else if sum == m{
        cnt += 1
        s += 1
    }else{
        s += 1
    }
}
print(cnt)
