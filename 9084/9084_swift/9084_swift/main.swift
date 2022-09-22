//
//  main.swift
//  9084_swift
//
//  Created by Hyun on 2022/09/21.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t{
    let n = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map{Int($0)!}
    let m = Int(readLine()!)!
    var dp = Array(repeating: 0, count: m+1)
    dp[0] = 1

    for coin in coins{
        if coin > m{ continue }
        for i in coin...m{
            dp[i] += dp[i-coin]
        }
    }
    print(dp[m])
}

//import Foundation
//let T = Int(readLine()!)!
//for _ in 0..<T {
//    let N = Int(readLine()!)!
//    let coins: [Int] = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
//    let M = Int(readLine()!)!
//
//    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
//
//    for i in 0...N { // 각 행의 1열 모두 1로 초기화.
//        dp[i][0] = 1
//    }
//
//    for i in 1...N {
//        if coins[i] > M {continue}
//        for j in stride(from: coins[i], through: M, by: 1) { // 동전의 가치가 구해야 하는 합M보다 클 때, 에러를 방지하기 위해.
//            let temp = dp[i - 1][j] + dp[i][j - coins[i]]
//
//            if temp > Int(pow(2.0, 31.0)) - 1 { // 경우의 수가 2^31 -1을 벗어나는 경우, 에러를 방지하기 위해.
//                dp[i][j] = 0
//            }
//            else {
//                dp[i][j] += temp
//            }
//        }
//    }
//
//    print(dp[N][M])
//}
