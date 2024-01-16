import Foundation

let (N,M,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var map = Array(repeating: [(node:Int, cost:Int)](), count:N)

for _ in 0..<M{
    let (u,v,h) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,h))
}

func dijk(from root:Int) -> [Int]{
    var minCost = Array(repeating: -1, count: N)
    var q = [(node:Int, cost:Int)]()
    var dq = q
    
    minCost[root] = 0
    q.append((root,0))
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if minCost[curr.node] < curr.cost{ continue }
            
            for next in map[curr.node]{
                let newCost = max(curr.cost, next.cost)
                
                if minCost[next.node]<0 || minCost[next.node]>newCost{
                    minCost[next.node] = newCost
                    q.append((next.node, newCost))
                }
            }
        }
        q.sort(by: {$0.cost < $1.cost})
    }
    
    return minCost
}
var res = Dictionary<Int,[Int]>()

for _ in 0..<T{
    let (S,E) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    if res[S] == nil{
        res[S] = dijk(from: S)
    }
    print(res[S]![E])
}