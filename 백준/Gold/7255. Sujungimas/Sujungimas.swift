import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let S = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
var comp = N

var arr = Array(repeating: -1, count: N)

func rootOf(node:Int)->Int{
    if arr[node]<0 {return node}
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}
func union(a:Int, b:Int, cost:Int){
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    if ra==rb{ return }
    arr[rb] = ra
    ans += cost
    comp -= 1
}

for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    union(a: u, b: v, cost: 0)
}

var edges = [(u:Int, v:Int, cost:Int)]()
for i in 0..<N-1{
    for k in i+1..<N{
        let cost = S[i]*S[k]
        edges.append((i,k,cost))
    }
}
edges.sort(by:{$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(ans)
