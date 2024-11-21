import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
var visited = Array(repeating: false, count: N)
var minCost = Array(repeating: 1000*N, count: N)
var runningTime = Array(repeating: 0, count: N)

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    
    let cost = info[0]
    runningTime[i] = cost
    
    for idx in 2..<info.count{
        map[i].append((info[idx]-1,cost))
    }
}

var q = [(node:Int, cost:Int)]()
q.append((node:0, cost:0))
minCost[0] = 0

while !q.isEmpty{
    let curr = q.removeLast()
    if visited[curr.node] { continue }
    visited[curr.node] = true
    
    for next in map[curr.node]{
        if minCost[next.node] > curr.cost + next.cost{
            minCost[next.node] = curr.cost + next.cost
            q.append((next.node, minCost[next.node]))
        }
    }
    
    q.sort(by: {$0.cost > $1.cost})
}

var ans = 0
for i in 0..<N{
    ans = max(ans, minCost[i]+runningTime[i])
}
print(ans)