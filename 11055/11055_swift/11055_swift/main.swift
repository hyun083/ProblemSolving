//
//  main.swift
//  11055_swift
//
//  Created by Hyun on 2022/08/22.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = arr
for i in 0..<n{
    for k in 0..<i{
        if arr[i]>arr[k] && dp[i]<dp[k]+arr[i]{
            dp[i] = dp[k]+arr[i]
        }
    }
}
print(dp.max()!)
