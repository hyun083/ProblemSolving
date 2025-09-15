import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var dp = Array(repeating: 1, count: N)
var ans = 1

for i in 0..<N{
    var maxCount = 0
    for k in 0..<i{
        if arr[i] > arr[k] && dp[k] > maxCount{
            maxCount = dp[k]
        }
    }
    dp[i] = maxCount + 1
    ans = max(ans, dp[i])
}
print(ans)