import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: -1001, count: N+1)

for i in 0..<N{
    if i == 0{
        dp[i] = arr[i]
    }else{
        dp[i] = max(dp[i-1]+arr[i],arr[i])
    }
}
print(dp.max()!)