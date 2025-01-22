import Foundation

let N = Int(readLine()!)!
var arr = [Double]()
var ans = 0.0
var dp = Array(repeating: 0.0, count: N)
for _ in 0..<N{
    let num = Double(readLine()!)!
    arr.append(num)
}
dp[0] = arr[0]
ans = arr[0]
for i in 1..<N{
    dp[i] = max(arr[i],dp[i-1]*arr[i])
    ans = max(ans,dp[i])
}
print(String(format: "%.3f", round(ans*1000)/1000))