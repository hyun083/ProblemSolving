import Foundation

func readArr() -> [Int]{
    return readLine()!.split(separator: " ").map{Int($0)!}
}

func root(of node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let rootOfA = root(of: a)
    let rootOfB = root(of: b)
    
    if rootOfA == rootOfB { return }
    
    arr[rootOfB] = rootOfA
    ans += cost
}

let N = Int(readLine()!)!
var cost = [[Int]]()
var edges = [(u:Int, v:Int, cost:Int)]()
var arr = Array(repeating: -1, count: N)
var ans = 0

for _ in 0..<N{
    cost.append(readArr())
}

for U in 0..<N{
    for V in U+1..<N{
        edges.append((U,V,cost[U][V]))
    }
}
edges.sort(by: {$0.cost < $1.cost})

for edge in edges {
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(ans)