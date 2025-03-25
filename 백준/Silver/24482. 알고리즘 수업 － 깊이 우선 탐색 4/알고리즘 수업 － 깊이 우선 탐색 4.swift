import Foundation

let NMR = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMR[0]
let M = NMR[1]
let R = NMR[2]-1

var ans = Array(repeating: -1, count: N)
var map = Array(repeating: Set<Int>(), count: N)
var visited = Array(repeating: false, count: N)
for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
    let U = UV[0]
    let V = UV[1]
    map[U].insert(V)
    map[V].insert(U)
}

func dfs(from curr:Int, depth:Int){
    for next in map[curr].sorted(by: >){
        if !visited[next]{
            visited[next] = true
            ans[next] = depth
            dfs(from: next, depth: depth+1)
        }
    }
}

ans[R] = 0
visited[R] = true
dfs(from: R, depth: 1)
for ans in ans{
    print(ans)
}