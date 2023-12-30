import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let N = info[0]
let M = info[1]
let A = info[2]-1
let B = info[3]-1
let C = info[4]

var minShame = Array(repeating: 1001, count: N)
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
for _ in 0..<M{
    let (u,v,cost) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,cost))
    map[v].append((u,cost))
}

var q = [(node:Int, totalCost:Int, shame:Int)]()
var dq = q
var ans = 1001

q.append((A,0,0))

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if curr.node == B{ break }
        
        for next in map[curr.node]{
            let newShame = max(curr.shame, next.cost)
            let newCost = curr.totalCost + next.cost
            if newCost > C { continue }
            if minShame[next.node] >= newShame{
                minShame[next.node] = newShame
                q.append((next.node, newCost, newShame))
            }
        }
    }
    q.sort(by: {$0.shame < $1.shame})
}

print(minShame[B]==1001 ? -1:minShame[B])