import Foundation

let (A,B) = [readLine()!.split(separator:" ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
let (N,M) = [readLine()!.split(separator:" ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var ans = -1

for _ in 0..<M{
    let (a,b) = [readLine()!.split(separator:" ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    map[a].append(b)
    map[b].append(a)
}

var q:[(idx:Int, cnt:Int)] = [(A,0)]
visited[A] = true
var idx = 0

while idx<q.count{
    let curr = q[idx]
    if curr.idx == B{
        ans = curr.cnt
        break
    }
    
    for next in map[curr.idx]{
        if visited[next] { continue }
        visited[next] = true
        q.append((next,curr.cnt+1))
    }
    
    idx += 1
}

print(ans)