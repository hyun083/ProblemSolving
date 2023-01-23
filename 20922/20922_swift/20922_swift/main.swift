//
//  main.swift
//  20922_swift
//
//  Created by Hyun on 2023/01/22.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var cnt = Array(repeating: 0, count: 100001)
var ans = 0
var length = 0
var head = 0
var tail = 0

while tail < n{
    let num = arr[tail]
    if cnt[num] >= k{
        cnt[arr[head]] -= 1
        head += 1
        length -= 1
    }else if tail == n{
        break
    }else{
        cnt[num] += 1
        tail += 1
        length += 1
        ans = max(ans, length)
    }
}
print(ans)
