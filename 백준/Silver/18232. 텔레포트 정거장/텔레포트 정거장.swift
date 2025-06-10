import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

let SE = readLine()!.split(separator: " ").map{Int($0)!-1}
let S = SE[0]
let E = SE[1]

var map = Array(repeating: [Int](), count: N)
var minCost = Array(repeating: Int.max, count: N)
minCost[S] = 0

for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
    let U = UV[0]
    let V = UV[1]
    map[U].append(V)
    map[V].append(U)
}

func bfs(from root:Int){
    var idx = 0
    var q = [(node:Int, cost:Int)]()
    q.append((root,0))
    
    while idx < q.count{
        let curr = q[idx]
        let nodes = [curr.node-1,curr.node+1] + map[curr.node]

        for next in nodes{
            if next < 0 || next >= N{ continue }
            
            if minCost[next] > curr.cost+1{
                minCost[next] = curr.cost+1
                q.append((next, curr.cost+1))
            }
        }
        
        idx += 1
    }
}
bfs(from: S)
print(minCost[E])