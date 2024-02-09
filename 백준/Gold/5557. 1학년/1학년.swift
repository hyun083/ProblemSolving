import Foundation

let N = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map{Int($0)!}
let target = num.removeLast()
var dp = Array(repeating: Array(repeating: 0, count: 21), count: N-1)
dp[0][num[0]] = 1

for i in 1..<N-1{
    for k in 0..<21{
        if dp[i-1][k]>0{
            if k-num[i]>=0 { dp[i][k-num[i]] += dp[i-1][k] }
            if k+num[i]<=20{ dp[i][k+num[i]] += dp[i-1][k] }
        }
    }
}
print(dp[N-2][target])