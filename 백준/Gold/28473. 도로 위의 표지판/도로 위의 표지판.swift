import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var edges = [(u:Int, v:Int, num:Int, cost:Int)]()
var arr = Array(repeating: -1, count: N)
var comp = N
var totalCost = 0
var path = ""

func root(of node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, num:String, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
    comp -= 1
    totalCost += cost
    path += num
}

for _ in 0..<M{
    let (x,y,z,w) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2], $0[3])}[0]
    edges.append((x,y,z,w))
}
edges.sort(by: {$0.num==$1.num ? $0.cost>$1.cost : $0.num>$1.num})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, num: String(edge.num), cost:edge.cost)
}

if comp>1{
    print(-1)
}else{
    print(path, totalCost)
}