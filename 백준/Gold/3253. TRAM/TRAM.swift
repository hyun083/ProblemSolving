import Foundation

let NAB = readLine()!.split(separator: " ").map{Int($0)!}
let N = NAB[0]
let A = NAB[1]-1
let B = NAB[2]-1
var map = Array(repeating: [Int](), count: N)

for node in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    
    let cnt = info[0]
    for i in 1..<cnt+1{
        map[node].append(info[i]-1)
    }
}

var visited = Array(repeating: 101, count: N)

func dfs(from curr:Int, with cost:Int){
    if curr == B { return }
    let cnt = map[curr].count
    
    for i in 0..<cnt{
        let nextNode = map[curr][i]
        let nextCost = cost+(i==0 ? 0:1)
        
        if visited[nextNode] > nextCost{
            visited[nextNode] = nextCost
            dfs(from: nextNode, with: nextCost)
        }
    }
}

visited[A] = 0
dfs(from: A, with: 0)
print(visited[B]==101 ? -1:visited[B])