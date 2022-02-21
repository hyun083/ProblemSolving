//
//  main.swift
//  blobyum_swift
//
//  Created by Hyun on 2022/02/21.
//

import Foundation

let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NK[0]
let K = NK[1]
let pies = readLine()!.split(separator: " ").map{Int(String($0))!}

if K == 1{
    print(pies.max()!)
}else if K == N{
    print(pies.reduce(0, +))
}else{
    var dp = Array(repeating: 0, count: N)
    for i in 0..<N{
        for p in i..<i+K{
            dp[i] += pies[p%N]
        }
    }
    print(dp.max()!)
}
