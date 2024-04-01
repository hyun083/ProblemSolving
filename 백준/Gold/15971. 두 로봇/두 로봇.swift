import Foundation

let (N,U,V) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1]-1, $0[2]-1)}[0]
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<N-1{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,c))
    map[v].append((u,c))
}

func dijk(from dep:Int, to des:Int) -> Int{
    var cost = Array(repeating: Int.max, count: N)
    var q = [(node:Int, sum:Int, maxCost:Int)]()
    var dq = q
    
    q.append((dep,0,0))
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if cost[curr.node] < curr.sum { continue }
            
            if curr.node == des{
                return curr.sum - curr.maxCost
            }
            
            for next in map[curr.node]{
                if cost[next.node] > curr.sum+next.cost{
                    cost[next.node] = curr.sum+next.cost
                    q.append((next.node, cost[next.node], max(next.cost, curr.maxCost)))
                }
            }
        }
    }
    return -1
}

print(dijk(from: U, to: V))