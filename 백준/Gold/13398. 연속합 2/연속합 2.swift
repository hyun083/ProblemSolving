import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = arr.min()!
var dp = Array(repeating: Array(repeating: -1001, count: 2), count: N)
dp[0][0] = arr[0]

for i in 1..<N{
    dp[i][0] = max(dp[i-1][0]+arr[i],arr[i])
    dp[i][1] = max(dp[i-1][0],dp[i-1][1]+arr[i])
    ans = max(ans, max(dp[i][0],dp[i][1]))
}

print(ans)