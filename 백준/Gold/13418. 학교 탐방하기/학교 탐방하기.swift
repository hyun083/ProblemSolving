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

func union(a:Int, b:Int, cost:Int) -> Int{
    let rootA = root(of: a)
    let rootB = root(of: b)
    
    if rootA == rootB{ return 0}
    
    arr[rootB] = rootA
    cnt -= 1
    return cost
}

let NM = readInt()
let N = NM[0]+1
let M = NM[1]

var arr = Array(repeating: -1, count: N)
var visited = Array(repeating: false, count: N)
var cnt = N
var ans = 0

let UVC = readInt()
let u = UVC[0]
let v = UVC[1]
let c = UVC[2]==0 ? 1:0

ans += union(a: u, b: v, cost: c)

var edges = [(u:Int,v:Int,cost:Int)]()

for _ in 0..<M{
    let UVC = readInt()
    let u = UVC[0]
    let v = UVC[1]
    let c = UVC[2]==0 ? 1:0

    edges.append((u,v,c))
}
var desc = edges.sorted(by: {$0.cost > $1.cost})
var asc = edges.sorted(by: {$0.cost < $1.cost})

let tmpArr = arr
let tmpAns = ans

while cnt > 1{
    let edge = asc.removeLast()
    ans += union(a: edge.u, b: edge.v, cost: edge.cost)
}

let maximum = ans*ans

arr = tmpArr
cnt = N-1
ans = tmpAns
while cnt > 1{
    let edge = desc.removeLast()
    ans += union(a: edge.u, b: edge.v, cost: edge.cost)
}
let minimum = ans*ans

print(maximum-minimum)