import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var dp = Array(repeating: 1, count: N)

for i in 0..<N{
    dp[i] = 1
    for k in 0..<i{
        if arr[k] < arr[i]{
            dp[i] = max(dp[i], dp[k]+1)
        }
    }
}
print(dp.max()!)