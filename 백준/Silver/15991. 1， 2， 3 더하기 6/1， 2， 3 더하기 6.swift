import Foundation

let t = Int(readLine()!)!
var dp = Array(repeating: 0, count: 100001)
dp[1] = 1
dp[2] = 2
dp[3] = 2
dp[4] = 3
dp[5] = 3
dp[6] = 6
for i in 7..<100001{
    dp[i] = (dp[i-2]+dp[i-4]+dp[i-6])%1000000009
}

for _ in 0..<t{
    let n = Int(readLine()!)!
    print(dp[n])
}