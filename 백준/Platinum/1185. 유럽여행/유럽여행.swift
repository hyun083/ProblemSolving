import Foundation

let (N,P) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, cost:Int)]()
var fee = [Int]()
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
    
    if A==B { return }
    arr[B] = A
    ans += cost
    comp -= 1
}
for _ in 0..<N{
    fee.append(Int(readLine()!)!)
}

for _ in 0..<P{
    let (s,e,l) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2]*2)}[0]
    edges.append((s,e,l+fee[s]+fee[e]))
}
edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(ans+fee.min()!)