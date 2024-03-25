import Foundation

let (N,M,A,B,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2]-1, $0[3]-1, $0[4])}[0]

var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,c))
}
var ans = -1

func bfs(limit:Int)->Bool{
    var visited = Array(repeating: false, count: N)
    visited[A] = true
    
    var q = [(node:Int, sum:Int, hi:Int)]()
    var dq = q
    q.append((A,0,0))
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if curr.node == B{
                ans = curr.hi
                return true
            }
            for next in map[curr.node]{
                if visited[next.node] { continue }
                if curr.sum + next.cost <= C && max(curr.hi, next.cost) <= limit{
                    visited[next.node] = true
                    q.append((next.node, curr.sum + next.cost, max(curr.hi, next.cost)))
                }
            }
        }
    }
    return false
}

var lo = 0
var hi = Int.max/2

while lo<=hi{
    let mid = (lo+hi)/2
    
    if bfs(limit: mid){
        hi = mid-1
    }else{
        lo = mid+1
    }
}

print(ans)