//
//  main.swift
//  2011_swift
//
//  Created by Hyun on 2022/10/24.
//

import Foundation

var encrypt = [0]+readLine()!.map{Int(String($0))!}
let n = encrypt.count-1
var dp = Array(repeating: 0, count: encrypt.count)
dp[0] = 1

for idx in 1...n{
    if encrypt[idx] > 0{
        dp[idx] = (dp[idx] + dp[idx-1]) % 1000000
    }
    if idx==1 || encrypt[idx-1]==0{
        continue
    }
    let temp = encrypt[idx-1]*10 + encrypt[idx]
    if 9<temp && temp<27{
        dp[idx] = (dp[idx] + dp[idx-2]) % 1000000
    }
}
print(dp[n])
