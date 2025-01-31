import Foundation

let N = Int(readLine()!)!
let weight = readLine()!.split(separator: " ").map{Int($0)!}

let M = Int(readLine()!)!
let target = readLine()!.split(separator: " ").map{Int($0)!}

var dp = Array(repeating: Array(repeating: false, count: 40001), count: N)
dp[0][0] = true
dp[0][0+weight[0]] = true
dp[0][abs(0-weight[0])] = true

for i in 1..<N{
    let w = weight[i]
    for t in 0...40000{
        if dp[i-1][t] {
            dp[i][t] = true
            if t+w <= 40000{ dp[i][t+w] = true }
            if abs(t-w) <= 40000{ dp[i][abs(t-w)] = true }
        }
    }
}

for num in target{
    print(dp[N-1][num] ? "Y":"N",terminator: " ")
}