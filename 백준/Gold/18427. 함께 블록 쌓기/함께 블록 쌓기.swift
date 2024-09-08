import Foundation

let MOD = 10007
let NMH = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMH[0]
let M = NMH[1]
let H = NMH[2]

var arr = [[Int]]()
arr.append([0])
for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append(line)
}

var dp = Array(repeating: Array(repeating: 0, count: H+1), count: N+1)
dp[0][0] = 1

for i in 1...N{
    let block = arr[i]
    for target in 0...H{
        for height in block{
            if target < height {
                continue
            }else{
                dp[i][target] += dp[i-1][target-height]
                dp[i][target] %= MOD
            }
        }
        dp[i][target] += dp[i-1][target]
        dp[i][target] %= MOD
    }
}
print(dp[N][H])