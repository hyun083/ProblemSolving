import Foundation

let INF = 1000000000
let (V,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: [(node:Int, cost:Int)](), count: V)

for _ in 0..<M{
    let (a,b,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[a].append((b,c))
    map[b].append((a,c))
}
let (J,S) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]

func dijk(from root:Int) -> [Int]{
    var minCost = Array(repeating: INF, count: V)
    var q = [(node:Int, cost:Int)]()
    var dq = q
    
    minCost[root] = 0
    q.append((root,0))
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if minCost[curr.node] < curr.cost { continue }
            
            for next in map[curr.node]{
                let newCost = curr.cost + next.cost
                
                if minCost[next.node] > newCost{
                    minCost[next.node] = newCost
                    q.append((next.node, newCost))
                }
            }
        }
        q.sort(by: {$0.cost < $1.cost})
    }
    return minCost
}

let costFromJto = dijk(from: J)
let costFromSto = dijk(from: S)
var ans = [(cost:Int, j:Int, s:Int, num:Int)]()
var target = INF

for place in (0..<V).reversed(){
    if place==J || place==S { continue }
    let newCost = costFromJto[place]+costFromSto[place]
    target = min(target, newCost)
    ans.append((newCost, costFromJto[place], costFromSto[place], place+1))
}
ans = ans.filter({$0.cost == target})
ans = ans.filter({$0.j <= $0.s})
ans.sort(by: {
    if $0.j == $1.j{
        return $0.num<$1.num
    }else{
        return $0.j < $1.j
    }
})

print(ans.isEmpty ? -1:ans.first!.num)