import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let N = line[0]
let M = line[1]
let R = line[2]-1

var ans = Array(repeating: 0, count: N)
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = info[0]
    let v = info[1]
    
    map[u].append(v)
    map[v].append(u)
}

for i in 0..<N{ map[i].sort(by: <) }

visited[R] = true
ans[R] += 1
var q = [R]
var idx = 0
var seq = 2

while idx < q.count{
    let curr = q[idx]
    
    for next in map[curr]{
        if !visited[next]{
            visited[next] = true
            q.append(next)
            ans[next] = seq
            seq += 1
        }
    }
    
    idx += 1
}
for ans in ans{ print(ans) }