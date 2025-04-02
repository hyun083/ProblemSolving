import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: 0, count: N)
var visited = Array(repeating: false, count: N)
var ans = 0
var target = 0

for i in 0..<N{
    map[i] = Int(readLine()!)!-1
}

func dfs(from curr:Int) -> Int{
    var res = 1
    
    let next = map[curr]
    if !visited[next]{
        visited[next] = true
        res += dfs(from: next)
    }
    
    return res
}

for node in stride(from: N-1, through: 0, by: -1){
    visited = Array(repeating: false, count: N)
    visited[node] = true
    let cnt = dfs(from: node)
    if target <= cnt{
        target = cnt
        ans = node+1
    }
}
print(ans)