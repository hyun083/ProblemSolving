//
//  main.swift
//  1149_swift
//
//  Created by Hyun on 2021/12/29.
//

import Foundation

let N = Int(readLine()!)!
var ans = Array(repeating: Array(repeating: 0, count: 3), count: N+1)

for i in 1...N{
    let cost =  readLine()!.split(separator: " ").map{Int(String($0))!}
    ans[i][0] = min(ans[i-1][1], ans[i-1][2]) + cost[0]
    ans[i][1] = min(ans[i-1][0], ans[i-1][2]) + cost[1]
    ans[i][2] = min(ans[i-1][0], ans[i-1][1]) + cost[2]
}
print(min(ans[N][2], min(ans[N][0], ans[N][1])))
