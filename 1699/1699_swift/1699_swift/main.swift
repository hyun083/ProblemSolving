//
//  main.swift
//  1699_swift
//
//  Created by Hyun on 2022/09/24.
//

import Foundation

var dp = [Int](0...100001)

for i in 1..<100001{
    for k in 1..<i{
        if k*k <= i{
            dp[i] = min(dp[i], dp[i-k*k]+1)
        }else{
            continue
        }
    }
}
let n = Int(readLine()!)!
print(dp[n])
