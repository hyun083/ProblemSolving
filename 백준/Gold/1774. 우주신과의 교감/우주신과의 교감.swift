import Foundation

struct Planet{
    let x:Double
    let y:Double
}

func cost(from u:Planet, to v:Planet) -> Double{
    sqrt((abs(u.x - v.x)*abs(u.x - v.x)) + (abs(u.y - v.y)*abs(u.y - v.y)))
}

func root(of node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Double){
    let rootA = root(of: a)
    let rootB = root(of: b)
    
    if rootA == rootB { return }
    
    arr[rootB] = rootA
    sum += cost
    cnt -= 1
}

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var sum = 0.00
var arr = Array(repeating: -1, count: N)
var planets = [Planet]()
var cnt = N

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Double($0)!}
    planets.append(Planet(x: info[0], y: info[1]))
}

for _ in 0..<M{
    let num = readLine()!.split(separator: " ").map{Int($0)!-1}
    union(a: num[0], b: num[1], cost: 0)
}

var edges = [(u:Int, v:Int, cost:Double)]()

for i in 0..<N-1{
    for k in i+1..<N{
        edges.append((i,k,cost(from: planets[i], to: planets[k])))
    }
}
edges.sort(by: {$0.cost > $1.cost})

while cnt > 1{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(String(format: "%.2f", round(sum*100)/100))