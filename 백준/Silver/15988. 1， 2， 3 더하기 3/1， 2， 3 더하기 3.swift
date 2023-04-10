import Foundation

var dp = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 4
let mod = 1000000009
for i in 4...1000000{
    dp[i] = ((dp[i-1]%mod) + (dp[i-2]%mod) + (dp[i-3]%mod))%mod
}
for _ in 0..<Int(readLine()!)!{
    let n = Int(readLine()!)!
    print(dp[n])
}