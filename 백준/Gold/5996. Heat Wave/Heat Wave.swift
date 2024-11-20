import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let T = info[0], C = info[1], U = info[2]-1, V = info[3]-1

var map = Array(repeating: [(node:Int, cost:Int)](), count: T)

for _ in 0..<C{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let u = info[0]-1, v = info[1]-1, cost = info[2]
    map[u].append((node:v, cost:cost))
    map[v].append((node:u, cost:cost))
}

var q = [(node:Int, cost:Int)]()
q.append((node:U, cost:0))
var visited:Set<Int> = []
var ans = Array(repeating: Int.max, count: T)

while !q.isEmpty{
    let curr = q.removeLast()
    if visited.contains(curr.node){
        continue
    }
    visited.insert(curr.node)
    
    for (next, cost) in map[curr.node]{
        if ans[next] > curr.cost + cost{
            ans[next] = curr.cost + cost
            q.append((node:next, cost:curr.cost + cost))
        }
    }
    q.sort(by: {$0.cost > $1.cost})
}
print(ans[V])