import Foundation

let NMP = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMP[0]
let M = NMP[1]
let P = NMP[2]-1

var map = Array(repeating:-1, count: M)
for _ in 0..<N{
    let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
    let U = UV[0]
    let V = UV[1]
    if map[V] < 0{
        map[V] = U
    }
}

func bfs(from root:Int) -> Int{
    var visited = Array(repeating: false, count: M)
    var idx = 0
    var q = [(node:Int, cnt:Int)]()
    q.append((root,0))
    visited[root] = true
    
    while idx < q.count{
        let curr = q[idx]
        let next = map[curr.node]
        if next < 0{ return curr.cnt }
        
        if !visited[next]{
            visited[next] = true
            q.append((next,curr.cnt+1))
        }else{
            return -1
        }
        idx += 1
    }
    return q.last!.cnt
}
print(bfs(from: P))