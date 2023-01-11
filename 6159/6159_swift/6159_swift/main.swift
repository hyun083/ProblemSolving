//
//  main.swift
//  6159_swift
//
//  Created by Hyun on 2023/01/10.
//

import Foundation

let ns = readLine()!.split(separator: " ").map{Int($0)!}
let n = ns[0]
let s = ns[1]
var arr = [Int]()

for _ in 0..<n{ arr.append(Int(readLine()!)!) }

var cnt = 0

for i in 0..<n-1{
    for k in i+1..<n{
        if arr[i] + arr[k] <= s{
            cnt += 1
        }
    }
}
print(cnt)
