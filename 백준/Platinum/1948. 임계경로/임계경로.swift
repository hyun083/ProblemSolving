import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var visited = Array(repeating: false, count: N)
var arr = Array(repeating: [(Int,Int)](), count: N)
var revArr = Array(repeating: [(Int,Int)](), count: N)

var revDegree = Array(repeating: 0, count: N)
var degree = Array(repeating: 0, count: N)

var cost = Array(repeating: 0, count: N)
var revCost = Array(repeating: 0, count: N)

for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let u = info[0]-1
    let v = info[1]-1
    let cost = info[2]
    
    arr[u].append((v,cost))
    revArr[v].append((u,cost))
    degree[v] += 1
    revDegree[u] += 1
}

var UV = readLine()!.split(separator: " ").map{Int($0)!-1}
let U = UV[0]
let V = UV[1]

var q = [(U)]
while !q.isEmpty{
    let currTown = q.removeLast()
    let currCost = cost[currTown]
    
    for info in arr[currTown]{
        let nextTown = info.0
        let newCost = info.1 + currCost
        
        cost[nextTown] = max(cost[nextTown], newCost)
        
        degree[nextTown] -= 1
        if degree[nextTown] == 0{
            q.append(nextTown)
        }
    }
}

q = [(V)]
while !q.isEmpty{
    let currTown = q.removeLast()
    let currCost = revCost[currTown]
    
    for info in revArr[currTown]{
        let nextTown = info.0
        let newCost = info.1 + currCost
        
        revCost[nextTown] = max(revCost[nextTown], newCost)
        
        revDegree[nextTown] -= 1
        if revDegree[nextTown] == 0{
            q.append(nextTown)
        }
    }
}

var roads = 0
q = [(U)]
while !q.isEmpty{
    let currTown = q.removeLast()
    let currCost = cost[currTown]
    visited[currTown] = true

    for info in arr[currTown]{
        let nextTown = info.0
        let nextCost = info.1 + currCost

        if nextCost == cost[nextTown] && cost[nextTown]+revCost[nextTown] == cost[V]{
            roads += 1
        }

        if !visited[nextTown]{
            q.append(nextTown)
        }
    }
}

print(cost[V])
print(roads)