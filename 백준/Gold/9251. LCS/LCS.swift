import Foundation

let str1 = readLine()!.map{String($0)}
let str2 = readLine()!.map{String($0)}
var dp = Array(repeating: Array(repeating: 0, count: str2.count+1), count: str1.count+1)
for i in 0..<str1.count{
    for k in 0..<str2.count{
        if str1[i] == str2[k]{
            dp[i+1][k+1] = dp[i][k] + 1
        }else{
            dp[i+1][k+1] = max(dp[i][k+1], dp[i+1][k])
        }
    }
}
var result = 0
for d in dp{
    if result < d.max()!{
        result = d.max()!
    }
}
print(result)