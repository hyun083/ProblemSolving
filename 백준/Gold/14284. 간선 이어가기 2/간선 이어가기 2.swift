import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
    let(u,v,cost) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,cost))
    map[v].append((u,cost))
}
let (S,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]

var q = [(node:Int, cost:Int)]()
var dq = [(node:Int, cost:Int)]()
var cost = Array(repeating: 500000, count: N)
cost[S] = 0

q.append((S,0))

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if curr.cost > cost[curr.node] { continue }
        
        for next in map[curr.node]{
            let newCost = cost[curr.node]+next.cost
            
            if newCost < cost[next.node]{
                cost[next.node] = newCost
                q.append((next.node, newCost))
            }
        }
    }
    q.sort(by: {$0.cost < $1.cost})
}
print(cost[T])