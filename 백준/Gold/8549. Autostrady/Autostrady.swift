import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var comp = N
var ans = 0
var edges = [(u:Int, v:Int, c:Int)]()

func rootOf(node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    if ra == rb { return }
    
    arr[rb] = ra
    comp -= 1
    ans = max(ans, cost)
}

for _ in 0..<M{
    let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    edges.append((u,v,c))
}
edges.sort(by: {$0.c > $1.c})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.c)
}
print(ans)