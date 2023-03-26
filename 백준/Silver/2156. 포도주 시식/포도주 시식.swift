import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var dp = Array(repeating: -1, count: N+1)

arr.append(0)
for _ in 1...N{
    arr.append(Int(readLine()!)!)
}

dp[0] = 0
dp[1] = arr[1]
if N>1{
    dp[2] = arr[1] + arr[2]
}
if N>3{
    for i in 3...N{
        dp[i] = max(dp[i-1], max(dp[i-2]+arr[i], dp[i-3] + arr[i-1] + arr[i]))
    }
}

print(dp.max()!)