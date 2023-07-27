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
    
    arr[A] = B
    sum += cost
}

let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: N+1)
var cost = [Int]()
var edges = [(u:Int, v:Int, cost:Int)]()
var sum = 0

for u in 0..<N{
    let cost = Int(readLine()!)!
    edges.append((u,N,cost))
}

for u in 0..<N{
    let info = readInt()
    for v in u+1..<N{
        edges.append((u,v,info[v]))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(sum)