import Foundation

let INF = Int.max
let MN = readLine()!.split(separator: " ").map{Int($0)!}
let M = MN[0], N = MN[1]
var map = Array(repeating: [(node:Int, cost:Int)](), count: M)
var visited = Array(repeating: false, count: M)
var ans:[(value:Int, depth:Int)] = Array(repeating: (INF,INF), count: M)

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let U = info[0], V = info[1], C = info[2]
    map[U].append((node:V, cost:C))
}

var q = [(node:Int, cost:Int, depth:Int)]()
q.append((0,0,0))
ans[0].depth = 0
ans[0].value = 0

while !q.isEmpty{
    let curr = q.removeLast()
    if visited[curr.node] {continue}
    visited[curr.node] = true
    
    for next in map[curr.node]{
        let newCost = curr.cost + next.cost
        if ans[next.node].depth >= curr.depth+1{
            ans[next.node].depth = curr.depth+1
            ans[next.node].value = ans[next.node].depth > curr.depth+1 ? newCost:min(ans[next.node].value,newCost)
            q.append((next.node, newCost, curr.depth+1))
        }
    }
    
    q.sort{$0.depth == $1.depth ? $0.cost>$1.cost : $0.depth>$1.depth }
}
print(ans[1].value)