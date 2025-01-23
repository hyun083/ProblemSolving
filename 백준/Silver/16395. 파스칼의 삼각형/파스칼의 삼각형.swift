import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var dp = Array(repeating: Array(repeating: 0, count: 31), count: 31)
dp[1][1] = 1
for i in 1..<30{
    for k in 1...i{
        let curr = dp[i][k]
        dp[i+1][k] += curr
        dp[i+1][k+1] += curr
    }
}
print(dp[N][K])