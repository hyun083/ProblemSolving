import Foundation

let N = Int(readLine()!)!
var town = [(x:Int, y:Int)]()
var comp = N
var ans = [(u:Int, v:Int)]()

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    town.append((x,y))
}

var arr = Array(repeating: -1, count: N)

func rootOf(node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    
    if ra==rb { return }
    arr[rb]=ra
    comp -= 1
    if cost>0{
        ans.append((a+1,b+1))
    }
}

let M = Int(readLine()!)!
for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    union(a: u, b: v, cost: 0)
}

var edges = [(u:Int, v:Int, cost:Int)]()

func cost(from a:(x:Int,y:Int), to b:(x:Int,y:Int)) -> Int{
    let tmp = (abs(a.x-b.x)*abs(a.x-b.x)) + (abs(a.y-b.y)*abs(a.y-b.y))
    return tmp
}

for i in 0..<N-1{
    for k in i+1..<N{
        let cost = cost(from: town[i], to: town[k])
        edges.append((i,k,cost))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
for ans in ans{
    print(ans.u,ans.v)
}