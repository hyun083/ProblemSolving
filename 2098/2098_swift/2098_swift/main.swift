//
//  main.swift
//  2098_swift
//
//  Created by Hyun on 2021/12/14.
//

import Foundation

let N = Int(readLine()!)!

var map = Array(repeating: [Int](), count: N)
var dp = Array(repeating: Array(repeating: -1, count: 1<<N), count: N)

for i in 0..<N{
    map[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

func TSP(curr:Int, visited:Int) -> Int{
    let ret = dp[curr][visited]
    if ret != -1 {
        return ret
    }

    if visited == (1<<N)-1{
        if map[curr][0] != 0 {
            return map[curr][0]
        }
        return 10000000000000
    }

    dp[curr][visited] = 10000000000000

    for i in 0..<N{
        if visited&(1<<i) == 1 || map[curr][i] == 0{
            continue
        }
        dp[curr][visited] = min(dp[curr][visited], TSP(curr: i, visited: visited|(1<<i))+map[curr][i])
    }
    return dp[curr][visited]
}

print(TSP(curr: 0, visited: 1))
