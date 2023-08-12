import Foundation

func readInt() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

func root(of node:Int) -> Int{
    if arr[node] < 0{ return node }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B{ return }
    arr[B] = A
    cnt -= 1
    ans[a].append(b+1)
    ans[b].append(a+1)
}

let N = Int(readLine()!)!
var edges = [(u:Int, v:Int, cost:Int)]()
var cnt = N
var ans = Array(repeating: [Int](), count: N)
var arr = Array(repeating: -1, count: N)

for u in 0..<N-1{
    let cost = readInt()
    for v in 0..<cost.count{
        edges.append((u,u+v+1,cost[v]))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while cnt>1{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v)
}

for ans in ans{
    print(ans.count,terminator: " ")
    for num in ans.sorted(by: <){
        print(num, terminator: " ")
    }
    print()
}