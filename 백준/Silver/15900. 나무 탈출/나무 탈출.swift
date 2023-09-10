import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N)
var cnt = Array(repeating: 0, count: N)
var ans = 0
var outdegree = Array(repeating: 0, count: N)

for _ in 0..<N-1{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1,$0[1]-1)}[0]
    arr[u].append(v)
    arr[v].append(u)
}

func bfs(){
    var visited = Array(repeating: false, count: N)
    var q = [(node:Int, cnt:Int)]()
    visited[0] = true
    q.append((0,0))
    var idx = 0
    
    while idx < q.count{
        let curr = q[idx]
        
        var flag = false
        for next in arr[curr.node]{
            if !visited[next]{
                flag = true
                visited[next] = true
                q.append((next, curr.cnt+1))
            }
        }
        
        if !flag{
            ans += curr.cnt
        }
        idx += 1
    }
    
}
bfs()
print(ans%2==0 ? "No":"Yes")