import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, cost:Int, time:Int)]()
var totalCost = 0
var lastTime = 0
var comp = N

func rootOf(node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, c:Int, t:Int){
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    if ra == rb { return }
    arr[rb] = ra
    totalCost += c
    lastTime = max(lastTime, t)
    comp -= 1
}

for _ in 0..<M{
    let (u,v,cost,time) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2], $0[3])}[0]
    edges.append((u,v,cost,time))
}
edges.sort(by: {$0.cost==$1.cost ? $0.time>$1.time:$0.cost>$1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, c: edge.cost, t: edge.time)
}
print(comp==1 ? "\(lastTime) \(totalCost)":"-1")