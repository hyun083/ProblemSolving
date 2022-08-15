//
//  main.swift
//  2491_swift
//
//  Created by Hyun on 2022/08/15.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0

var start = 0
var cnt = 1
while start < n-1{
    if arr[start] <= arr[start+1]{
        cnt += 1
    }else{
        ans = max(ans, cnt)
        cnt = 1
    }
    start += 1
}
ans = max(ans, cnt)

start = 0
cnt = 1
while start < n-1{
    if arr[start] >= arr[start+1]{
        cnt += 1
    }else{
        ans = max(ans, cnt)
        cnt = 1
    }
    start += 1
}
ans = max(ans, cnt)
print(ans)
