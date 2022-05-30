//
//  main.swift
//  10159_swift
//
//  Created by Hyun on 2022/05/30.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: false, count: n), count: n)
var check = Array(repeating: 0, count: n)
for _ in 0..<m{
    let uv = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = uv[0] - 1
    let v = uv[1] - 1
    arr[u][v] = true
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if arr[u][k] && arr[k][v]{ arr[u][v] = true }
        }
    }
}

for u in 0..<n{
    for v in 0..<n{
        if u == v {continue}
        if !arr[u][v] && !arr[v][u]{
            check[u] += 1
        }
    }
}
for c in check{
    print(c)
}
