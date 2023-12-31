import Foundation

let (N,V,E) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
let (A,B) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
let home = readLine()!.split(separator: " ").map{Int($0)!-1}
var map = Array(repeating: [(node:Int, cost:Int)](), count: V)

for _ in 0..<E{
    let (u,v,cost) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,cost))
    map[v].append((u,cost))
}

func dijk(from root:Int) -> [Int]{
    var res = Array(repeating: -1, count: V)
    res[root] = 0
    
    var q = [(node:Int, cost:Int)]()
    var dq = q
    
    q.append((root,0))
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if res[curr.node] < curr.cost { continue }
            
            for next in map[curr.node]{
                let newCost = res[curr.node] + next.cost
                
                if res[next.node]>newCost || res[next.node]<0{
                    res[next.node] = newCost
                    q.append((next.node, newCost))
                }
            }
        }
        q.sort(by: {$0.cost < $1.cost})
    }
    
    return res
}
var ans = 0
let kist = dijk(from: A)
let food = dijk(from: B)
for i in home{
    let dist = kist[i]+food[i]
    ans += dist == -2 ? -1:dist
}

print(ans)