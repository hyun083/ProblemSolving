import Foundation

let (F,B) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var flower = [(x:Int, y:Int)]()
var arr = Array(repeating: -1, count: F)
var edges = [(u:Int, v:Int, cost:Double)]()
var ans:Double = 0
var comp = F

for _ in 0..<F{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    flower.append((x,y))
}

func cost(from u:(x:Int, y:Int), to v:(x:Int, y:Int)) -> Double {
    return sqrt(pow(Double(u.x - v.x), 2) + pow(Double(u.y - v.y), 2))
}

func rootOf(node:Int) -> Int{
    if arr[node]<0 {return node}
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Double){
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    
    if ra==rb { return }
    arr[rb] = ra
    ans = max(ans, cost)
    comp -= 1
}

for i in 0..<F-1{
    for k in i+1..<F{
        edges.append((i,k,cost(from: flower[i], to: flower[k])))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while comp>B && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(String(format: "%.2f", round(ans*100)/100))