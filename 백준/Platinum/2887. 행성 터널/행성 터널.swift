import Foundation

struct Planet{
    let x:Int
    let y:Int
    let z:Int
    let num:Int
}

func cost(a:Planet,with b:Planet) -> Int{
    min(min(abs(a.x-b.x), abs(a.y-b.y)), abs(a.z-b.z))
}

func readArr() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

let N = Int(readLine()!)!
var planets = [Planet]()
var arr = Array(repeating: -1, count: N)
var ans = 0
var component = N

for num in 0..<N{
    let info = readArr()
    let planet = Planet(x: info[0], y: info[1], z: info[2], num: num)
    planets.append(planet)
}

var X = planets.sorted(by: {$0.x < $1.x})
var Y = planets.sorted(by: {$0.y < $1.y})
var Z = planets.sorted(by: {$0.z < $1.z})

func root(of node:Int) -> Int{
    if arr[node]<0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let rootOfA = root(of: a)
    let rootOfB = root(of: b)
    
    if rootOfA == rootOfB{ return }
    
    arr[rootOfB] = rootOfA
    ans += cost
    component -= 1
}

var xIdx = 0
var yIdx = 0
var zIdx = 0

var edges = [(u:Int,v:Int,cost:Int)]()

for idx in 0..<N-1{
    let xCost = cost(a: X[idx], with: X[idx+1])
    let yCost = cost(a: Y[idx], with: Y[idx+1])
    let zCost = cost(a: Z[idx], with: Z[idx+1])
    
    edges.append((X[idx].num,X[idx+1].num,xCost))
    edges.append((Y[idx].num,Y[idx+1].num,yCost))
    edges.append((Z[idx].num,Z[idx+1].num,zCost))
}
edges.sort(by: {$0.cost > $1.cost})

while component>1{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

print(ans)