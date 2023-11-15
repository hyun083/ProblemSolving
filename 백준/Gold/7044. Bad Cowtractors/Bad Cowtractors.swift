import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var ans = 0
var comp = N
var edges = [(u:Int, v:Int, cost:Int)]()

func root(of node:Int) -> Int{
    if arr[node]<0 {return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
    ans += cost
    comp -= 1
}

for _ in 0..<M{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    edges.append((u,v,c))
}
edges.sort(by: {$0.cost < $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(comp>1 ? -1:ans)