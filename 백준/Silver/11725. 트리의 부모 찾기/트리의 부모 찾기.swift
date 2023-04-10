import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var ans = Array(repeating: 0, count: N)
var visited = Array(repeating: false, count: N)

for _ in 1..<N{
    let nodes = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    map[nodes[0]].append(nodes[1])
    map[nodes[1]].append(nodes[0])
}

func dfs(from node:Int){
    for idx in map[node].indices{
        let next = map[node][idx]
        visited[node] = true
        if visited[next] == false{
            ans[next] = node
            dfs(from: next)
        }
    }
}

dfs(from: 0)
for i in 1..<N{
    print(ans[i]+1)
}