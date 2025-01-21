import Foundation

let N = Int(readLine()!)!
var dCnt = 0
var dp = Array(repeating: 0, count: 41)
func dynamic(num:Int){
    dp[1] = 1; dp[2] = 1
    for i in 3...num{
        dp[i] = dp[i-1]+dp[i-2]
        dCnt += 1
    }
}
dynamic(num: N)
print(dp[N], dCnt)