import Foundation

let N = Int(readLine()!)!
var dp = [10001]+readLine()!.split(separator: " ").map{Int($0)!}

for i in 1...N{
    for k in 0..<i{
        dp[i] = min(dp[i], dp[i-k]+dp[k])
    }
}
print(dp.last!)