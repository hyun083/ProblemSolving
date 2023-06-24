import Foundation

var ans = 0
let N = Int(readLine()!)!
let I = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 0..<I{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = info[0]
    let v = info[1]
    arr[u].append(v)
    arr[v].append(u)
}

func dfs(from node:Int){
    visited[node] = true
    ans += 1
    
    for next in arr[node]{
        if !visited[next]{
            dfs(from: next)
        }
    }
}

dfs(from: 0)
print(ans-1)