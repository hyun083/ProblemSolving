import Foundation

let (N,M,X,Y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2], $0[3])}[0]
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
    let (u,v,cost) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    map[u].append((v,cost))
    map[v].append((u,cost))
}

let INF = 1000000000
var remain = X
var ans = 1
var minCost = Array(repeating: INF, count: N)
var q = [(node:Int, cost:Int)]()
var dq = q

minCost[Y] = 0
q.append((Y,0))

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if curr.cost > minCost[curr.node] { continue }
        
        for next in map[curr.node]{
            let newCost = minCost[curr.node] + next.cost
            
            if minCost[next.node] > newCost{
                minCost[next.node] = newCost
                q.append((next.node, newCost))
            }
        }
    }
}

for cost in minCost.sorted(by: {$0<$1}){
    if cost*2 > X{
        ans = -1
        break
    }
    
    if remain >= cost*2{
        remain -= cost*2
    }else{
        remain = X - (cost*2)
        ans += 1
    }
}
print(ans)