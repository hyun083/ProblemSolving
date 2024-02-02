import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: [(node:Int, cost:Int)](), count:N)

for _ in 0..<M{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,c))
    map[v].append((u,c))
}

var minCost = Array(repeating: Int.max, count: N)
minCost[0] = 0

var q = [(node:Int, cost:Int)]()
var dq = q
var ans = Array(repeating: -1, count: N)

q.append((0,0))
ans[0] = 0

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        
        if minCost[curr.node] < curr.cost{ continue }
        for next in map[curr.node]{
            let newCost = curr.cost + next.cost
            if newCost < minCost[next.node]{
                minCost[next.node] = newCost
                q.append((next.node, newCost))
                ans[next.node] = curr.node + 1
            }
        }
    }
    q.sort(by: {$0.cost < $1.cost})
}
print(N-1)
for i in 1..<N{
    print(i+1, ans[i])
}