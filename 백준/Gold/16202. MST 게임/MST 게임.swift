import Foundation

func readInt() -> [Int]{
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
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
    cnt -= 1
    sum += cost
}

let NMK = readInt()
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, cost:Int)]()
var cnt = N
var sum = 0

for cost in 1...M{
    let UV = readInt()
    let U = UV[0]-1
    let V = UV[1]-1
    
    edges.append((U,V,cost))
}

for k in 0..<K{
    arr = Array(repeating: -1, count: N)
    var idx = k
    cnt = N
    sum = 0
    
    while cnt>1 && idx<edges.count{
        let edge = edges[idx]
        
        union(a: edge.u, b: edge.v, cost: edge.cost)
        idx += 1
    }
    print(cnt==1 ? sum:0,terminator: " ")
}