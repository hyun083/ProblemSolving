//
//  main.swift
//  15565_swift
//
//  Created by Hyun on 2023/01/15.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]

var map = readLine()!.split(separator: " ").map{Int($0)!}

var head = 0
var tail = 0
var cnt = 0
var ans = n+1

while true{
    if cnt >= k{
        if map[head] == 1{ cnt -= 1 }
        head += 1
    }else if tail == n{
        break
    }else{
        if map[tail] == 1{ cnt += 1 }
        tail += 1
    }
    if cnt==k{
        let length = tail - head
        ans = min(ans, length)
    }
}
print(ans>n ? -1:ans)
