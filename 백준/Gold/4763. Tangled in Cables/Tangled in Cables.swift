import Foundation

let spool = Double(readLine()!)!
let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, c:Double)]()
var ans:Double = 0
var comp = N

func root(of node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Double){
    let A = root(of: a)
    let B = root(of: b)
    if A==B { return }
    arr[B] = A
    ans += cost
    comp -= 1
}

var house = Dictionary<String,Int>()

for i in 0..<N{
    let name = readLine()!
    house[name] = i
}

let M = Int(readLine()!)!
for _ in 0..<M{
    let (u,v,c) = [readLine()!.split(separator: " ").map{String($0)}].map{(house[$0[0]]!, house[$0[1]]!, Double($0[2])!)}[0]
    edges.append((u,v,c))
}
edges.sort(by: {$0.c > $1.c})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.c)
}

print(ans<=spool ? "Need \(String(format: "%.1f", ans)) miles of cable":"Not enough cable")