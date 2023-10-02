import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var edges = [(u:Int, v:Int, cost:Int)]()
var arr = Array(repeating: -1, count: N)
var ans = 0

func root(of node:Int) -> Int{
    if arr[node]<0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A == B {
        ans += cost
        return
    }
    arr[B] = A
}

for _ in 0..<M{
    let (u,v,cost,isConnected) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2], $0[3])}[0]
    if isConnected==1{
        union(a: u, b: v, cost: cost)
    }else{
        edges.append((u,v,cost))
    }
}

edges.sort(by: {$0.cost < $1.cost})

while !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(ans)