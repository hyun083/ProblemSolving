import Foundation

let N = Int(readLine()!)!
var cost = [[Int]]()
let MAX = 1000000000
var dp = Array(repeating: Array(repeating: MAX, count: 3), count: N)
var ans = MAX

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    cost.append(info)
}

for start in 0..<3{
    for i in 0..<3{
        if i == start{ 
            dp[0][i] = cost[0][i]
        } else{
            dp[0][i] = MAX
        }
    }
    
    for i in 1..<N{
        dp[i][0] = cost[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = cost[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = cost[i][2] + min(dp[i-1][0], dp[i-1][1])
    }
    
    for last in 0..<3{
        if start != last{
            ans = min(ans, dp[N-1][last])
        }
    }
}
print(ans)