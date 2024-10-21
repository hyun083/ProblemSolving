import Foundation

let NMX = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMX[0]
let M = NMX[1]
let X = NMX[2]-1

let maxCost = 100001
var map = Array(repeating: Array(repeating: maxCost, count: N), count: N)
var ans = Array(repeating: maxCost, count: N)
ans[X] = 0
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
var visited = Array(repeating: false, count: N)
visited[X] = true

for i in 0..<N{
    if map[X][i] < maxCost{
        q.append((i,map[X][i]))
    }
}
q.sort(by: {$0.cost > $1.cost})

while !q.isEmpty{
    let cur = q.removeLast()
    if ans[cur.node] < cur.cost{ continue }
   
    for next in 0..<N{
        let nextCost = map[cur.node][next]
        if ans[next] > cur.cost + nextCost{
            ans[next] = cur.cost + nextCost
            q.append((next,ans[next]))
        }
    }
}

var res = 0
for i in 0..<N{
    if ans[i] < maxCost{
        res = max(res, ans[i])
    }
}
print(res*2)