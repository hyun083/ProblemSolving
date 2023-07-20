import Foundation

func readArr() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
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
    
    if rootOfA == rootOfB{ return }
    arr[rootOfB] = rootOfA
    ans += cost
}

let NM = readArr()
let N = NM[0]
let M = NM[1]

var school = readLine()!.split(separator: " ").map{String($0)}
var arr = Array(repeating: -1, count: N)
var edges = [(U:Int, V:Int, cost:Int)]()
var ans = 0

for _ in 0..<M{
    let info = readArr()
    let u = info[0]-1
    let v = info[1]-1
    let cost = info[2]
    
    if school[u] == school[v]{ continue }
    edges.append((u,v,cost))
}
edges.sort(by: {$0.cost < $1.cost})

for edge in edges {
    union(a: edge.U, b: edge.V, cost: edge.cost)
}

print(arr.filter({$0 < 0}).count>1 ? -1:ans)