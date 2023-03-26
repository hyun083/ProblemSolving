import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var dp = Array(repeating: [0,1], count: N)

for _ in 0..<N-1{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let u = info[0]-1
    let v = info[1]-1
    map[u].append(v)
    map[v].append(u)
}

func dfs(from n:Int){
    visited[n] = true
    
    for child in map[n]{
        if !visited[child]{
            dfs(from: child)
            dp[n][0] += dp[child][1]
            dp[n][1] += min(dp[child][0], dp[child][1])
        }
    }
}

dfs(from: 0)
print(dp[0].min()!)