//
//  main.swift
//  11051_swift
//
//  Created by Hyun on 2022/09/19.
//

import Foundation

var dp = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)
dp[0][0] = 1
dp[1][0] = 1
dp[1][1] = 1
for i in 2..<1001{
    for k in 0...i{
        if k == 0{
            dp[i][k] = 1
            continue
        }else if k == i{
            dp[i][k] = 1
        }
        dp[i][k] = ((dp[i-1][k-1]%10007) + (dp[i-1][k]%10007))%10007
    }
}
let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]
print(dp[n][k])

