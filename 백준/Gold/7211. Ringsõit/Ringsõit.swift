import Foundation

let (N,M,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var ans = 0
var comp = N
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, cost:Int, nation:Bool)]()

func root(of node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int, nation:Bool){
    let ra = root(of: a)
    let rb = root(of: b)
    
    if ra == rb {
        ans -= nation ? cost:0
        return
    }
    arr[rb] = ra
    comp -= 1
    ans += nation ? 0:cost
}

for _ in 0..<M{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    edges.append((u,v,c,true))
}

for _ in 0..<K{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    edges.append((u,v,c,false))
}
edges.sort(by: {$0.cost > $1.cost})

while !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost, nation: edge.nation)
}

print(ans<0 ? 0:ans)