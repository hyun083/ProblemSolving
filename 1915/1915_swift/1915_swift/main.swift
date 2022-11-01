//
//  main.swift
//  1915_swift
//
//  Created by Hyun on 2022/11/01.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

var ans = 0

for i in 0..<n{
    let line = readLine()!.map{Int(String($0))!}
    for k in 0..<m{
        map[i][k] = line[k]
        if map[i][k] == 1{
            ans = 1
        }
    }
}

if n>1 && m>1{
    for i in 1..<n{
        for k in 1..<m{
            if map[i][k] > 0{
                map[i][k] = min(min(map[i-1][k], map[i][k-1]), map[i-1][k-1]) + 1
                ans = max(ans, map[i][k])
            }
        }
    }
}
print(ans*ans)
