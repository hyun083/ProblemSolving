import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
var prev = Array(repeating: -1, count: N)

for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let U = info[0]-1
    let V = info[1]-1
    let cost = info[2]
    
    map[U].append((V,cost))
    map[V].append((U,cost))
}

func dijkstra(from DEP:Int) -> [Int] {
    var visited = Array(repeating: false, count: N)
    var minCost = Array(repeating: Int.max, count: N)
    var q = [(node:Int, cost:Int)]()
    q.append((DEP,0))
    minCost[DEP] = 0

    while !q.isEmpty{
        let curr = q.removeLast()
        if visited[curr.node] { continue }
        visited[curr.node] = true
    
        for next in map[curr.node]{
            if next.cost == Int.max { continue }
            let newCost = curr.cost + next.cost
            if newCost < minCost[next.node]{
                minCost[next.node] = newCost
                prev[next.node] = curr.node
                q.append((next.node, newCost))
            }
        }
        q.sort{$0.cost > $1.cost}
    }
    return minCost
}

func blockPath(){
    var currNode = N-1
    
    while currNode >= 0{
        let pre = prev[currNode]
        if pre<0 { return }
        
        map[currNode].sort(by: {$0.cost < $1.cost})
        map[pre].sort(by: {$0.cost < $1.cost})
        
        for i in 0..<map[currNode].count{
            if map[currNode][i].node == pre{
                map[currNode].remove(at: i)
                break
            }
        }
        
        for i in 0..<map[pre].count{
            if map[pre][i].node == currNode{
                map[pre].remove(at: i)
                break
            }
        }
        
        currNode = pre
    }
}

let resPre = dijkstra(from: 0)
blockPath()
let ans = dijkstra(from: 0)
print(ans[N-1])