import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: N)
var cows = [(x:Int, y:Int)]()
var edges = [(u:Int, v:Int, cost:Int)]()
var comp = N
var ans = 0

func root(of node:Int) -> Int{
    if arr[node] < 0 {
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, with b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B{ return }
    arr[B] = A
    ans = max(ans, cost)
    comp -= 1
}

func distance(from a:(x:Int, y:Int), to b:(x:Int, y:Int)) -> Int{
    return ((a.x-b.x)*(a.x-b.x)) + ((a.y-b.y)*(a.y-b.y))
}

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    cows.append((x,y))
}

for u in 0..<N-1{
    for v in u+1..<N{
        let cost = distance(from: cows[u], to: cows[v])
        edges.append((u,v,cost))
    }
}

edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, with: edge.v, cost: edge.cost)
}
print(ans)