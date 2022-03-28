//
//  main.swift
//  10844_swift
//
//  Created by Hyun on 2022/03/28.
//

import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: N+1)
let mod = 1000000000

for i in 1..<10{
    dp[1][i] = 1
}

if N > 1{
    for i in 2...N{
        for k in 0..<10{
            if k == 0{
                dp[i][k] = dp[i-1][k+1]%mod
            }else if k == 9{
                dp[i][k] = dp[i-1][k-1]%mod
            }else{
                dp[i][k] = (dp[i-1][k-1] + dp[i-1][k+1])%mod
            }
        }
    }
}
print(dp[N].reduce(0, +)%mod)
