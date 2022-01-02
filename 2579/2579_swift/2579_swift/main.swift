//
//  main.swift
//  2579_swift
//
//  Created by Hyun on 2022/01/01.
//

import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: 0, count: N+1)
var dp = Array(repeating: 0, count: N+1)

for i in 1...N{
    arr[i] = Int(readLine()!)!
}

if N == 1{
    print(arr[1])
}else if N == 2{
    print(arr[1] + arr[2])
}else{
    dp[1] = arr[1]
    dp[2] = arr[1]+arr[2]
    for i in 3...N{
        dp[i] = max(dp[i-2] + arr[i], dp[i-3] + arr[i-1] + arr[i])
    }
    print(dp[N])
}

