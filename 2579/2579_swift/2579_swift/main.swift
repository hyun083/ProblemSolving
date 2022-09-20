//
//  main.swift
//  2579_swift
//
//  Created by Hyun on 2022/01/01.
//

import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: 0, count: N+1)
var dp = Array(repeating: Array(repeating: 0, count: 3), count: N+1)

for i in 1...N{
    arr[i] = Int(readLine()!)!
}

dp[1][1] = arr[1]
dp[1][2] = 0

if N>1{
    dp[2][1] = arr[2]
    dp[2][2] = arr[1]+arr[2]
    if N>2{
        for i in 3...N{
            dp[i][1] = max(dp[i-2][1], dp[i-2][2]) + arr[i]
            dp[i][2] = dp[i-1][1] + arr[i]
        }
    }
}
print(max(dp[N][1], dp[N][2]))
