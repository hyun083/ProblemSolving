import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)
dp[0] = 0
dp[1] = 1

for i in 1...N{
    dp[i] = dp[1] + dp[i-1]
    if i >= 2{
        for k in 2...N{
            if k*k <= i{
                dp[i] = min(dp[i], 1+dp[i-(k*k)])
            }else{
                break
            }
        }
    }
}
print(dp[N])