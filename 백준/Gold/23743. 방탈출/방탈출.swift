import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: false, count: N)
var map = Array(repeating: [Int](), count: N)
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, cost:Int)]()
var edgeCost = 0
var comp = N

for _ in 0..<M{
    let(u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    edges.append((u,v,c))
}
let T = readLine()!.split(separator: " ").map{Int($0)!}

func root(of node:Int) -> Int{
    if arr[node]<0 {
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B{ return }
    if T[A] + T[B] < cost + min(T[A], T[B]){ return }
    
    if T[A] <= T[B]{
        arr[B] = A
    }else{
        arr[A] = B
    }

    map[A].append(B)
    map[B].append(A)
    edgeCost += cost
    comp -= 1
}

edges.sort(by: {$0.cost > $1.cost})
while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

var warpCost = 0
for i in 0..<N{
    if arr[i] < 0 {
        warpCost += T[i]
    }
}

print(min(warpCost+edgeCost, T.reduce(0, +)))