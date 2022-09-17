//
//  main.swift
//  1890_swift
//
//  Created by Hyun on 2022/09/17.
//

import Foundation

let n = Int(readLine()!)!

var map = Array(repeating: [Int](), count: n)
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n{
    map[i] = readLine()!.split(separator: " ").map{Int($0)!}
}

dp[0][0]=1
for x in 0..<n{
    for y in 0..<n{
        if map[x][y]==0 || dp[x][y]==0{continue}
        let nx = x + map[x][y]
        let ny = y + map[x][y]
        if nx<n{ dp[nx][y] += dp[x][y]}
        if ny<n{ dp[x][ny] += dp[x][y]}
    }
}
print(dp[n-1][n-1])
