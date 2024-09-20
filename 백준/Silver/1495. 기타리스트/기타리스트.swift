import Foundation

let NSM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NSM[0]
let S = NSM[1]
let M = NSM[2]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dp = Array(repeating: Array(repeating: false, count: M+1), count: N+1)
dp[0][S] = true

for i in 0..<N {
    let next = arr[i]
    for k in 0...M{
        if dp[i][k] {
            if k-next >= 0 { dp[i+1][k-next] = true }
            if k+next <= M { dp[i+1][k+next] = true }
        }
    }
}

var ans = -1
for i in 0...M {
    if dp[N][i] {
        ans = i
    }
}
print(ans)