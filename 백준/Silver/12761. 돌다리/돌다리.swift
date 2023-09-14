import Foundation

let (A,B,N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2], $0[3])}[0]
var ans = Array(repeating: Int.max, count: 100001)

func bfs(from root:Int){
    var q = [(node:Int, cost:Int)]()
    var idx = 0
    let dx = [1,-1,-A,A,-B,B,A,B]
    
    q.append((root,0))
    
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<8{
            let nx = i>=6 ? curr.node*dx[i] : curr.node+dx[i]
            
            if nx<0 || nx>100000 { continue }
            if ans[nx] > curr.cost+1{
                ans[nx] = curr.cost+1
                q.append((nx,ans[nx]))
            }
        }
        
        idx += 1
    }
}

bfs(from: N)
print(ans[M])