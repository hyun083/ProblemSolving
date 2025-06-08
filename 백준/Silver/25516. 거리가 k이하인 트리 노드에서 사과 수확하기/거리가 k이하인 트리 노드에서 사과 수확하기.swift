import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let k = NK[1]
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 0..<N-1{
    let UV = readLine()!.split(separator: " ").map{Int($0)!}
    let U = UV[0]
    let V = UV[1]
    map[U].append(V)
}
var cntOn = readLine()!.split(separator: " ").map{Int($0)!}
var ans = cntOn[0]

func bfs(from root:Int){
    var idx = 0
    var q = [(node:Int, depth:Int)]()
    visited[root] = true
    q.append((root,0))
    while idx < q.count{
        let curr = q[idx]
        
        for next in map[curr.node]{
            if !visited[next] && curr.depth+1 <= k{
                visited[next] = true
                ans += cntOn[next]
                q.append((next,curr.depth+1))
            }
        }
        idx += 1
    }
}
bfs(from: 0)
print(ans)