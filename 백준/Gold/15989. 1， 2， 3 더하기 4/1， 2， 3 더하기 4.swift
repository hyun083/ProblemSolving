import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 4), count: 10001)
dp[1][1] = 1
dp[2][1] = 1
dp[2][2] = 1
dp[3][1] = 1
dp[3][2] = 1
dp[3][3] = 1

for i in 4..<10001{
    dp[i][1] += dp[i-1][1]
    dp[i][2] += dp[i-2][1] + dp[i-2][2]
    dp[i][3] += dp[i-3][1] + dp[i-3][2] + dp[i-3][3]
}

for _ in 0..<T{
    let N = Int(readLine()!)!
    print(dp[N].reduce(0, +))
}