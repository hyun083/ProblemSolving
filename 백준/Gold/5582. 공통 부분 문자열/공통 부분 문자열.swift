import Foundation

let A = readLine()!.map{String($0)}
let B = readLine()!.map{String($0)}
var dp = Array(repeating: Array(repeating: 0, count: A.count+1), count: B.count+1)
var ans = 0

for i in 1...B.count{
    for k in 1...A.count{
        if B[i-1]==A[k-1]{
            dp[i][k] = dp[i-1][k-1]+1
        }
        ans = max(ans,dp[i][k])
    }
}
print(ans)