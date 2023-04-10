import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
for i in 1..<N{
    dp[i] = dp[i]+dp[i-1]
}

for _ in 1...M{
    let ij = readLine()!.split(separator: " ").map{Int(String($0))!}
    let i = ij[0] - 1
    let j = ij[1] - 1

    if i == 0{
        print(dp[j])
    }else{
        print(dp[j]-dp[i-1])
    }
}