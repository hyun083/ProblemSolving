//
//  main.swift
//  2294_swift
//
//  Created by Hyun on 2022/09/17.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
var k = nk[1]

var dp = Array(repeating:10001, count:10001)
dp[0] = 0
var coins = [Int]()
for _ in 0..<n{
    let coin = Int(readLine()!)!
    if coin <= 10000{ coins.append(coin) }
}
coins = coins.sorted(by: <)

for coin in coins{
    for i in coin...10000{
        dp[i] = min(dp[i], dp[i-coin]+1)
    }
}
if dp[k] == 10001{
    print(-1)
}else{
    print(dp[k])
}
