import Foundation

let N = Int(readLine()!)!
let arr = Array(readLine()!.split(separator: " ").map{Int($0)!}.reversed())
var dp = Array(repeating: 1, count: N)

for i in 0..<N{
    let num = arr[i]
    for k in 0..<i{
        if arr[k] < num{
            dp[i] = max(dp[i], dp[k]+1)
        }
    }
}
print(dp.max()!)