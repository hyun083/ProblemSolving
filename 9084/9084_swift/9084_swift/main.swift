//
//  main.swift
//  9084_swift
//
//  Created by Hyun on 2022/09/21.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    let n = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map{Int($0)!}
    let m = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 10001)
    dp[0] = 1
    
    for coin in coins{
        for i in coin...10000{
            dp[i] += dp[i-coin]
        }
    }
    print(dp[m])
}
