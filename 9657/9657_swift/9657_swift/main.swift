//
//  main.swift
//  9657_swift
//
//  Created by Hyun on 2022/09/23.
//

import Foundation

//true - SK
//false - CY
var dp = Array(repeating: true, count: 1001)
dp[2] = false

for i in 5...1000{
    if dp[i-1] && dp[i-3] && dp[i-4]{
        dp[i] = false
    }
}
let n = Int(readLine()!)!
if dp[n] {
    print("SK")
}else{
    print("CY")
}
