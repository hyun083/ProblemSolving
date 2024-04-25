import Foundation

let (N,M,R) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2]-1)}[0]
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var degree = Array(repeating: -1, count: N)

for _ in 0..<M{
    let (U,V) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    map[U].append(V)
    map[V].append(U)
}

var q = [Int]()
var idx = 0

q.append(R)
visited[R] = true
degree[R] = 0

while idx < q.count{
    let curr = q[idx]
    for next in map[curr]{
        if !visited[next]{
            visited[next] = true
            degree[next] = degree[curr]+1
            q.append(next)
        }
    }
    idx += 1
}

for ans in degree{
    print(ans)
}