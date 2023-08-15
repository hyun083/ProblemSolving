import Foundation

func readInt() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

func root(of node:Int) -> Int{
    if arr[node]<0{ return node }
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
let cost = readInt()
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

var edges = [(u:Int, v:Int, cost:Int)]()
var arr = Array(repeating: -1, count: N+1)
var area = Array(repeating: true, count: N)
var cnt = N+1
var sum = 0

for _ in 0..<M{
    let info = readInt()
    let u = info[0]-1
    let v = info[1]-1
    
    if u==N-1&&v==0 || u==0&&v==N-1{
        area[u>v ? u:v] = false
    }else{
        area[u<v ? u:v] = false
    }
}

for u in 0..<N{
    if area[u]{
        union(a: u, b: (u+1)%N, cost: 0)
    }
}

for i in 0..<N{
    edges.append((N,i,cost[i]))
}
edges.sort(by: {$0.cost > $1.cost})

while cnt>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(M<2 ? "YES":sum<=K ? "YES":"NO")