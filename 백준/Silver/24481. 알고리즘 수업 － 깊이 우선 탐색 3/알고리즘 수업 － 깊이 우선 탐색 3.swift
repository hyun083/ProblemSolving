import Foundation

let (N,M,R) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2]-1)}[0]
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 0..<M{
    let (U,V) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    map[U].append(V)
    map[V].append(U)
}

var depth = Array(repeating: -1, count: N)

func dfs(from node:Int, cost:Int){
    for next in map[node].sorted(by: <){
        if visited[next] { continue }
        visited[next] = true
        depth[next] = cost+1
        dfs(from: next, cost: depth[next])
    }
}

depth[R] = 0
visited[R] = true
dfs(from: R, cost: 0)

for ans in depth{
    print(ans)
}
