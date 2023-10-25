import Foundation

let (N,M,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int)]()
var lastEdge: (u:Int, v:Int) = (0,0)

for i in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    if i+1 == K{
        lastEdge = (u,v)
    }else{
        edges.append((u,v))
    }
}

func root(of node:Int) -> Int{
    if arr[node] < 0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    if arr[A] < arr[B]{
        arr[A] += arr[B]
        arr[B] = A
    }else{
        arr[B] += arr[A]
        arr[A] = B
    }
}

while !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v)
}

let A = root(of: lastEdge.u)
let B = root(of: lastEdge.v)

print(A==B ? 0:arr[A]*arr[B])