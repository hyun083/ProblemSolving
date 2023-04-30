import Foundation

let INF = 50000001
let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
    let ABC = readLine()!.split(separator: " ").map{Int($0)!}
    let U = ABC[0]-1
    let V = ABC[1]-1
    let C = ABC[2]
    
    arr[U].append((V,C))
    arr[V].append((U,C))
}

func dijk(from start:Int, to end:Int) -> Int{
    var minCost = Array(repeating: INF, count: N)
    var visited = Array(repeating: false, count: N)
    var q = [(node:Int, cost:Int)]()
    
    q.append((start,0))
    minCost[start] = 0
    
    while !q.isEmpty{
        let curr = q.removeLast()
        
        visited[curr.node] = true
        if curr.node == end{ break }
        
        for next in arr[curr.node]{
            if visited[next.node] { continue }
            let newCost = curr.cost + next.cost
            
            if minCost[next.node] > newCost{
                minCost[next.node] = newCost
                q.append((next.node,newCost))
            }
        }
        
        q.sort(by: { $0.cost > $1.cost })
    }
    
    return minCost[end]
}

let ans = dijk(from: 0, to: N-1)
print(ans)