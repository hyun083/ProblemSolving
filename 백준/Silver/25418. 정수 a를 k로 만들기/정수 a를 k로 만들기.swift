import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]

func bfs(from u:Int, to v:Int)->Int{
    var q = [(num:Int, cnt:Int)]()
    var visited = Array(repeating: false, count: v+1)
    var idx = 0
    
    q.append((u,0))
    visited[u] = true
    
    while idx<q.count{
        let curr = q[idx]
        if curr.num == v {
            return curr.cnt
        }
        
        if curr.num+1<=v && !visited[curr.num+1] {
            visited[curr.num+1] = true
            q.append((curr.num+1,curr.cnt+1))
        }
        if curr.num*2<=v && !visited[curr.num*2]{
            visited[curr.num*2] = true
            q.append((curr.num*2,curr.cnt+1))
        }
        idx += 1
    }
    return -1
}
print(bfs(from: N, to: K))