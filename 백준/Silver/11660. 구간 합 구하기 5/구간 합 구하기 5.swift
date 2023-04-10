import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var res = ""

var map = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var dp = map

for i in 1...N{
    var arr = [0]
    arr += readLine()!.split(separator: " ").map{Int(String($0))!}
    map[i] = arr
}

for i in 1...N{
    for k in 1...N{
        dp[i][k] = map[i][k] + dp[i-1][k] + dp[i][k-1] - dp[i-1][k-1]
    }
}

for _ in 1...M{
    let range = readLine()!.split(separator: " ").map{Int(String($0))!}
    let x1 = range[0]
    let y1 = range[1]
    let x2 = range[2]
    let y2 = range[3]
    let ans = dp[x2][y2] - dp[x2][y1-1] - dp[x1-1][y2] + dp[x1-1][y1-1]
    res += String(ans) + "\n"
}
print(res)