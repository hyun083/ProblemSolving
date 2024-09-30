import Foundation

let NMR = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMR[0]
let M = NMR[1]
let R = NMR[2]-1

var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var queue: [Int] = []
var idx = 0
var D = Array(repeating: -1, count: N)
var T = Array(repeating: 0, count: N)
var order = 2

D[R] = 0
T[R] = 1

for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map{Int($0)!}
    let U = UV[0]-1
    let V = UV[1]-1
    
    map[U].append(V)
    map[V].append(U)
}

for i in 0..<N{
    map[i].sort(by: <)
}

queue.append(R)
visited[R] = true
while idx<queue.count{
    let curr = queue[idx]
    for next in map[curr]{
        if !visited[next]{
            visited[next] = true
            queue.append(next)
            D[next] = D[curr]+1
            T[next] = order
            order += 1
        }
    }
    idx += 1
}

var ans = 0
for i in 0..<N{
    ans += (D[i]*T[i])
}
print(ans)