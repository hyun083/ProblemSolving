//
//  main.swift
//  15991_swift
//
//  Created by Hyun on 2022/12/22.
//

import Foundation

let t = Int(readLine()!)!
var dp = Array(repeating: 0, count: 100001)
dp[1] = 1   //1
dp[2] = 2   //1+1, 2
dp[3] = 2   //1+1+1, 3
dp[4] = 3   //1+1+1+1, 1+2+1, 2+2,
dp[5] = 3   //1+1+1+1+1, 1+3+1, 2+1+2
dp[6] = 6   //1+1+1+1+1+1, 1+1+2+1+1, 1+2+2+1, 2+2+2, 2+1+1+2, 3+3

for i in 7..<100001{
    dp[i] = (dp[i-2]+dp[i-4]+dp[i-6])%1000000009
}

for _ in 0..<t{
    let n = Int(readLine()!)!
    print(dp[n])
}

