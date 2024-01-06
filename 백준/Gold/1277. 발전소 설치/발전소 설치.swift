import Foundation

let (N,W) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let M = Double(readLine()!)!
var plant = [(x:Int, y:Int)]()
var map = Array(repeating: [(node:Int, cost:Double)](), count: N)
var minCost = Array(repeating: Double(1000000), count: N)
minCost[0] = 0

func cost(from u:Int, to v:Int) -> Double{
    let U = plant[u]
    let V = plant[v]
    
    return sqrt(pow(Double(U.x-V.x), 2) + pow(Double(U.y-V.y),2))
}

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    plant.append((x,y))
}

for _ in 0..<W{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    map[u].append((v,0))
    map[v].append((u,0))
}

for i in 0..<N{
    for k in 0..<N{
        let cost = cost(from: i, to: k)
        if cost > M{ continue }
        map[i].append((k,cost))
        map[k].append((i,cost))
    }
}

var q = [(node:Int, cost:Double, cnt:Int)]()
var dq = q

q.append((0,0,0))

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if minCost[curr.node]<curr.cost || curr.cnt>=W{ continue }
        
        for next in map[curr.node]{
            let newCost = minCost[curr.node] + next.cost
            if minCost[next.node] > newCost{
                minCost[next.node] = newCost
                q.append((next.node, newCost, next.cost==0 ? curr.cnt:curr.cnt+1))
            }
        }
    }
    q.sort(by: {$0.cost < $1.cost})
}
print(Int(minCost[N-1]*1000))