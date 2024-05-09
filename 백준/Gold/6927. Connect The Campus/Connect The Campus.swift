import Foundation

func cost(from a:(x:Int,y:Int), b:(x:Int, y:Int)) -> Double{
    let dx = Double(a.x-b.x)
    let dy = Double(a.y-b.y)
    return sqrt(pow(dx, 2) + pow(dy, 2))
}

let N = Int(readLine()!)!
var coord = [(x:Int, y:Int)]()
var totalCost = 0.0
var ans = [(u:Int, v:Int)]()
var arr = Array(repeating: -1, count: N)
var comp = N

func rootOf(node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, c:Double) -> Bool{
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    if ra==rb{return false}
    arr[rb] = ra
    totalCost += c
    comp -= 1
    return true
}

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    coord.append((line[0], line[1]))
}

let M = Int(readLine()!)!
for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = line[0]
    let v = line[1]
    union(a: u, b: v, c: 0)
}

var edges = [(u:Int, v:Int, cost:Double)]()
for i in 0..<N-1{
    for k in i+1..<N{
        let cost = cost(from: coord[i], b: coord[k])
        edges.append((i,k,cost))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    if union(a: edge.u, b: edge.v, c: edge.cost) {
        ans.append((edge.u+1, edge.v+1))
    }
}

let ansCost:Double = round(totalCost*100)/100
print(String(format:"%.2f",ansCost))

for info in ans{
    print(info.u, info.v)
}