import Foundation

let NMX = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMX[0]
let M = NMX[1]
let X = NMX[2]-1

let maxCost = 100001
var map = Array(repeating: Array(repeating: maxCost, count: N), count: N)
var minCost = Array(repeating: maxCost, count: N)
minCost[X] = 0
for i in 0..<N{ map[i][i] = 0 }

for _ in 0..<M{
    let ABT = readLine()!.split(separator: " ").map{Int($0)!}
    let A = ABT[0]-1
    let B = ABT[1]-1
    let T = ABT[2]
    map[A][B] = min(map[A][B], T)
    map[B][A] = min(map[B][A], T)
}

var q = [(node:Int, cost:Int)]()
for i in 0..<N{
    if map[X][i] < maxCost{
        q.append((i,map[X][i]))
    }
}
q.sort(by: {$0.cost > $1.cost})

while !q.isEmpty{
    let cur = q.removeLast()
    if minCost[cur.node] < cur.cost{ continue }
   
    for next in 0..<N{
        let nextCost = map[cur.node][next]
        if minCost[next] > cur.cost + nextCost{
            minCost[next] = cur.cost + nextCost
            q.append((next,minCost[next]))
        }
    }
}

var ans = 0
for i in 0..<N{
    if minCost[i] < maxCost{
        ans = max(ans, minCost[i])
    }
}
print(ans*2)