import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 0..<N-1{
    let UV = readLine()!.split(separator: " ").map{Int($0)!}
    let U = UV[0]
    let V = UV[1]
    map[U].append(V)
}

let valueOf = readLine()!.split(separator: " ").map{Int($0)!}

var idx = 0
var q = [(node:Int, depth:Int)]()
var ans = -1
q.append((0,0))

while idx<q.count{
    let curr = q[idx]
    if valueOf[curr.node] == K{
        ans = curr.depth
        break
    }
    
    for next in map[curr.node]{
        if !visited[next]{
            visited[next] = true
            q.append((next, curr.depth+1))
        }
    }
    idx += 1
}
print(ans)