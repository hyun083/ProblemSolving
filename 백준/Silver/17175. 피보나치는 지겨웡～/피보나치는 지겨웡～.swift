import Foundation

let MOD = 1000000007
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 51)
dp[0] = 1
dp[1] = 1

for i in 2..<51 {
    dp[i] = (dp[i-1] + dp[i-2] + 1)%MOD
}

print(dp[N])