import Foundation

let (N,Q) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0] , $0[1])}[0]
var arr = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<N-1{
    let (U,V,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1 , $0[1]-1, $0[2])}[0]
    arr[U].append((V,C))
    arr[V].append((U,C))
}

func bfs(from root:Int, detent K:Int) -> Int{
    var visited = Array(repeating: false, count: N)
    var cnt = 0
    var q = [Int]()
    var idx = 0
    
    visited[root] = true
    q.append(root)
    while idx < q.count{
        let curr = q[idx]
        
        for next in arr[curr]{
            if !visited[next.node] && next.cost >= K{
                visited[next.node] = true
                cnt += 1
                q.append(next.node)
            }
        }
        idx += 1
    }
    
    return cnt
}

for _ in 0..<Q{
    let (k,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0] , $0[1]-1)}[0]
    print(bfs(from: v, detent: k))
}