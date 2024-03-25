import Foundation

let (N,M,A,B,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2]-1, $0[3]-1, $0[4])}[0]

var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,c))
    map[v].append((u,c))
}
var ans = -1

func bfs(limit:Int) -> Bool{
    var visited = Array(repeating: Int.max, count: N)
    visited[A] = 0
    var q = [(node:Int, sum:Int, hi:Int)]()
    var dq = q
    q.append((A,0,0))
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if curr.sum > visited[curr.node] { continue }
            if curr.node == B{
                ans = curr.hi
                return true
            }
            for next in map[curr.node]{
                if curr.sum+next.cost >= visited[next.node] { continue }
                if curr.sum+next.cost <= C && max(curr.hi, next.cost) <= limit{
                    visited[next.node] = curr.sum + next.cost
                    q.append((next.node, curr.sum + next.cost, max(curr.hi, next.cost)))
                }
            }
        }
        q.sort(by: {$0.sum < $1.sum})
    }
    return false
}

var lo = 1
var hi = 1000000000

while lo<=hi{
    let mid = (lo+hi)/2
    
    if bfs(limit: mid){
        hi = mid-1
    }else{
        lo = mid+1
    }
}

print(ans)
