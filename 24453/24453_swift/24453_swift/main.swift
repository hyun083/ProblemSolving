//
//  main.swift
//  24453_swift
//
//  Created by Hyun on 2023/01/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var arr = Array(repeating: false, count: n+1)
let errors = readLine()!.split(separator: " ").map{Int($0)!}
for err in errors{
    arr[err] = true
}

let xy = readLine()!.split(separator: " ").map{Int($0)!}
let x = xy[0]
let y = xy[1]

var head = 1
var tail = 1

var errCnt = 0
var ans = 0

while tail<n+1{
    if arr[tail]{
        if errCnt >= y{
            if arr[head]{
                errCnt -= 1
            }
            head += 1
        }else{
            errCnt += 1
            tail += 1
        }
    }else{
        tail += 1
    }
    
    if x<=tail-head && y<=errCnt{
        ans = max(ans, m-errCnt)
    }
}
print(ans)
