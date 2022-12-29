//
//  main.swift
//  1208_swift
//
//  Created by Hyun on 2022/12/17.
//

import Foundation

let ns = readLine()!.split(separator: " ").map{Int($0)!}
let numbers = readLine()!.split(separator: " ").map{Int($0)!}
let n = ns[0]
let s = ns[1]
var cnt = 0

var arr = Array(repeating: 0, count: n+1)

for i in 1...n{
    let num = numbers[i-1]
    arr[i] = num + arr[i-1]
}
print(arr)
for i in 0...n-1{
    for k in i+1...n{
        if arr[k]-arr[i] == s{
            cnt += 1
        }
    }
}
print(cnt)
