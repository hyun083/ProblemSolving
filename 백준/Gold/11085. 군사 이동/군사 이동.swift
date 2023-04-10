import Foundation

let pw = readLine()!.split(separator: " ").map{Int($0)!}
let cv = readLine()!.split(separator: " ").map{Int($0)!}
let p = pw[0]
let w = pw[1]
let c = cv[0]
let v = cv[1]

var edges = [(u:Int, v:Int, cost:Int)]()
var nodes = Array(repeating: -1, count: p)
var cost = 1001

func root(of n:Int) -> Int{
    if nodes[n]<0 {return n}
    nodes[n] = root(of: nodes[n])
    return nodes[n]
}

func union(a:Int, b:Int, c:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB { return }
    nodes[rootB] = rootA
    cost = min(cost, c)
}

for _ in 0..<w{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let edge = (info[0],info[1],info[2])
    edges.append(edge)
}
edges.sort(by: {
    $0.cost > $1.cost
})

for edge in edges{
    union(a: edge.u, b: edge.v, c: edge.cost)
    if root(of: c) == root(of: v){ break }
}
print(root(of: c)==root(of: v) ? cost:0)