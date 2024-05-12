import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, cost:Int)]()
var ans = 0
var comp = N

func rootOf(node:Int) -> Int{
    if arr[node]<0 {return node}
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    if ra==rb {return}
    
    arr[rb] = ra
    ans = max(ans, cost)
    comp -= 1
}

for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    edges.append((info[0]-1, info[1]-1, info[2]))
}
edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(ans)