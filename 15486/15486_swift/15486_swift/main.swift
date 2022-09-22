//
//  main.swift
//  15486_swift
//
//  Created by Hyun on 2022/09/22.
//

import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)
var myMax = 0
for i in 0..<n{
    let tp = readLine()!.split(separator: " ").map{Int($0)!}
    let t = tp[0]
    let p = tp[1]
    myMax = max(myMax, dp[i])
    if i+t <= n{
        dp[i+t] = max(dp[i+t], myMax+p)
    }
}
print(dp.max()!)
