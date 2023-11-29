import Foundation

let n = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map{Int($0)!}
var dp = Array(repeating: 1, count: n)

for i in 0..<n{
    var tmp = 0
    for k in 0..<i{
        if num[k] < num[i]{
            tmp = max(tmp, dp[k])
        }
    }
    dp[i] = max(dp[i], tmp+1)
}
print(dp.max()!)