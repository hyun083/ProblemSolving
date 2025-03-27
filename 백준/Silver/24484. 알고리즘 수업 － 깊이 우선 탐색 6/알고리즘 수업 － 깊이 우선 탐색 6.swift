import Foundation

let NMR = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMR[0]
let M = NMR[1]
let R = NMR[2]-1

var map = Array(repeating: Set<Int>(), count: N)
var depth = Array(repeating: -1, count: N)
var visited = Array(repeating: 0, count: N)
var order = 1

for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map{Int($0)!}
    let U = UV[0]-1
    let V = UV[1]-1
    map[U].insert(V)
    map[V].insert(U)
}

func dfs(from curr:Int){
    for next in map[curr].sorted(by: >){
        if visited[next] == 0{
            visited[next] = order; order += 1
            depth[next] = depth[curr]+1
            dfs(from: next)
        }
    }
}

visited[R] = order; order += 1
depth[R] = 0
dfs(from: R)

var ans = 0
for i in 0..<N{
    ans += visited[i]*depth[i]
}
print(ans)