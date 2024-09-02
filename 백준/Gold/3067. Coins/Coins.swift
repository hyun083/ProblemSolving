import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    let coin = [0]+readLine()!.split(separator: " ").map{Int($0)!}
    let M = Int(readLine()!)!
    
    var dp = Array(repeating: Array(repeating: 0, count: N+1), count: M+1)
    for i in 0...N{
        dp[0][i] = 1
    }
    
    for i in 1...N{
        for target in 1...M{
            if coin[i] > target{
                dp[target][i] += dp[target][i-1]
            }else{
                dp[target][i] += dp[target][i-1] + dp[target-coin[i]][i]
            }
        }
    }
    print(dp[M][N])
}