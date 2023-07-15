import Foundation

let NMR = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMR[0]
let M = NMR[1]
let R = NMR[2]-1

var arr = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var ans = Array(repeating: 0, count: N)

for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
    let U = UV[0]
    let V = UV[1]
    
    arr[U].append(V)
    arr[V].append(U)
}

var order = 1
var idx = 0
var q = [R]
visited[R] = true

while idx < q.count{
    let curr = q[idx]
    ans[curr] = order
    
    for next in arr[curr].sorted(by: >){
        if !visited[next]{
            visited[next] = true
            q.append(next)
        }
    }
    
    order += 1
    idx += 1
}

for ans in ans{
    print(ans)
}