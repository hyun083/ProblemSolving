import Foundation

let (N,D) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: [(node:Int, cost:Int)](), count: 10001)
var cost = [Int](0...10000)

for _ in 0..<N{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    arr[u].append((v,c))
}

func bfs(from root:Int){
    var q = [(node:Int, cost:Int)]()
    var idx = 0
    
    q.append((root,0))
    while idx < q.count{
        let curr = q[idx]
        
        if curr.node >= D{
            idx += 1
            continue
        }
        
        for next in arr[curr.node]{
            if cost[next.node] >= curr.cost+next.cost{
                cost[next.node] = curr.cost+next.cost
                q.append((next.node,cost[next.node]))
            }
        }
        
        if cost[curr.node+1] >= curr.cost+1{
            cost[curr.node+1] = curr.cost+1
            q.append((curr.node+1, cost[curr.node+1]))
        }
        
        idx += 1
    }
}

bfs(from: 0)
print(cost[D])