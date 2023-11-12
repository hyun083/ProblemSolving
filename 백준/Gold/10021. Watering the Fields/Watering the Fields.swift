import Foundation

let (N,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var fields = [(x:Int, y:Int)]()
var edges = [(u:Int, v:Int, cost:Int)]()
var arr = Array(repeating: -1, count: N)
var comp = N
var ans = 0

func root(of node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B {return}
    arr[B] = A
    comp -= 1
    ans += cost
}

func cost(from A:(x:Int,y:Int), to B:(x:Int, y:Int)) -> Int{
    return ((A.x - B.x)*(A.x - B.x)) + ((A.y - B.y)*(A.y - B.y))
}

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    fields.append((x,y))
}

for i in 0..<N-1{
    for k in 0..<N{
        let cost = cost(from: fields[i], to: fields[k])
        if cost<C{ continue }
        edges.append((i,k,cost))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(comp>1 ? -1:ans)