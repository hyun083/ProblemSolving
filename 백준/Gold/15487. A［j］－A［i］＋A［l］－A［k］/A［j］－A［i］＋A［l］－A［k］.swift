import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dp = Array(repeating: Int.min, count: N-3)
var R = Int.min
var ans = Int.min
var tmp = arr[0]

for i in 1..<N-2{
    dp[i-1] = max(dp[i-1], arr[i]-tmp)
    tmp = min(tmp, arr[i])
}

tmp = arr[N-1]
for i in stride(from: N-2, to: 1, by: -1){
    R = max(R, tmp - arr[i])
    ans = max(ans, dp[i-2]+R)
    tmp = max(tmp, arr[i])
}
print(ans)