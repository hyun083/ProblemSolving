import Foundation

let INF = 100000000
let line = readLine()!.split(separator: " ").map{Int($0)!}
let V = line[0]
let E = line[1]
let P = line[2]-1
var arr = Array(repeating: [(node:Int, cost:Int)](), count: V)
var minCost = Array(repeating: INF, count: V)

for _ in 0..<E{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let A = info[0]-1
    let B = info[1]-1
    let C = info[2]
    
    arr[A].append((B,C))
    arr[B].append((A,C))
}

func dijk(){
    var visited = Array(repeating: false, count: V)
    var q = [(node:Int, cost:Int)]()
    q.append((0,0))
    minCost[0] = 0
    
    while !q.isEmpty{
        q.sort(by: {$0.cost > $1.cost})
        let curr = q.removeLast()
        visited[curr.node] = true
        
        for next in arr[curr.node]{
            if visited[next.node] { continue }
            let newCost = curr.cost + next.cost
            if minCost[next.node] > newCost{
                minCost[next.node] = newCost
                q.append((next.node,newCost))
            }
        }
    }
}

func bfs() -> Bool{
    var visited = Array(repeating: false, count: V)
    var res = false
    var q = [(node:Int, cost:Int)]()
    q.append((V-1,0))
    
    while !q.isEmpty{
        let curr = q.removeFirst()
        
        visited[curr.node] = true
        if curr.node == P{
            res = true
            break
        }
        
        for next in arr[curr.node]{
            if visited[next.node] { continue }
            if minCost[next.node] + curr.cost + next.cost == minCost[V-1]{
                q.append((next.node,curr.cost+next.cost))
            }
        }
    }
    
    return res
}

dijk()
print(bfs() ? "SAVE HIM":"GOOD BYE")