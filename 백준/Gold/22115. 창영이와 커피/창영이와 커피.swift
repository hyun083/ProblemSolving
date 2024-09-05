import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
let arr = [0]+readLine()!.split(separator: " ").map{Int($0)!}
let INF = 1000

var dp = Array(repeating:INF, count: K+1)
dp[0] = 0

for i in 1...N{
    let c = arr[i]
    for caff in stride(from: K, through: c, by: -1){
        if caff-c >= 0{
            dp[caff] = min(dp[caff], dp[caff-c]+1)
        }
    }
}
print(dp[K]==INF ? -1:dp[K])