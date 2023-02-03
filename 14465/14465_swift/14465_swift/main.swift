//
//  main.swift
//  14465_swift
//
//  Created by Hyun on 2023/02/03.
//

import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let n = info[0]
let k = info[1]
let b = info[2]

var arr = Array(repeating: true, count: n)
for _ in 0..<b{
    let idx = Int(readLine()!)!-1
    arr[idx] = false
}

var head = 0
var tail = 0
var cnt = 0
var ans = n

while tail < n{
    let length = tail - head
    if length >= k{
        if !arr[head]{
            cnt -= 1
        }
        head += 1
    }else{
        if !arr[tail]{
            cnt += 1
        }
        tail += 1
    }
    if length == k{
        ans = min(ans, cnt)
    }
}
print(ans)
