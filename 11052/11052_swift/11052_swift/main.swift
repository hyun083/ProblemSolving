//
//  main.swift
//  11052_swift
//
//  Created by Hyun on 2022/04/01.
//

import Foundation

var arr = [0]
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)

arr += readLine()!.split(separator: " ").map{Int(String($0))!}

for i in 1...N{
    for k in 1...i{
        dp[i] = max(dp[i], dp[i-k] + arr[k])
    }
}
print(dp[N])
