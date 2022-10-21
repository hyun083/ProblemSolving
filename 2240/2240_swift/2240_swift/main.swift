//
//  main.swift
//  2240_swift
//
//  Created by Hyun on 2022/10/21.
//

import Foundation

let tw = readLine()!.split(separator: " ").map{Int(String($0))!}
let t = tw[0] //시간
let w = tw[1] //움직임 횟수
var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: w+1), count: t+1)
for time in 1...t{
    let tree = Int(readLine()!)!-1
    dp[time][0][0] = dp[time-1][0][0] + (tree==0 ? 1:0)
    for move in 1...w{
        if move%2==0{
            dp[time][move][0] = max(dp[time-1][move-1][1], dp[time-1][move][0])+(tree==0 ? 1:0)
        }else{
            dp[time][move][1] = max(dp[time-1][move-1][0], dp[time-1][move][1])+(tree==1 ? 1:0)
        }
    }
}

var ans = 0
for move in 0...w{
    ans = max(ans, max(dp[t][move][0], dp[t][move][1]))
}
print(ans)
