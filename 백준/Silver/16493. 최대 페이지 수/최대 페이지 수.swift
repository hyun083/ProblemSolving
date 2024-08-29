import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var dp = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
var value = [0]
var weight = [0]

for _ in 0..<M{
    let WV = readLine()!.split(separator: " ").map{Int($0)!}
    weight.append(WV[0])
    value.append(WV[1])
}

for i in 1...M{
    for k in stride(from: N, through: 0, by: -1){
        if k < weight[i]{
            dp[k][i] = dp[k][i-1]
        }else{
            dp[k][i] = max(dp[k][i-1], dp[k-weight[i]][i-1]+value[i])
        }
    }
}
print(dp[N][M])