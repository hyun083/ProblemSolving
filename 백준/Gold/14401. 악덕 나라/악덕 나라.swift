import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var check = Set<[Int]>()
var city = [(x:Int, y:Int)]()
var edges = [(u:Int, v:Int, cost:Int)]()
var comp = N
var ans = 0

func root(of node:Int) -> Int{
    if arr[node] < 0 {
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, with b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B{ return }
    for i in 0..<N{
        if i==a || i==b { continue }
        if isPoint(city[i], Between: city[a], And: city[b]){
            return
        }
    }
    arr[B] = A
    
    ans += cost
    comp -= 1
}

func isPoint(_ point:(x:Int, y:Int), Between a:(x:Int, y:Int), And b:(x:Int, y:Int)) -> Bool{
    if a.x - b.x == 0{
        return min(a.y, b.y) <= point.y && point.y <= max(a.y, b.y)
    }else if a.y - b.y == 0{
        return min(a.x, b.x) <= point.x && point.x <= max(a.x, b.x)
    }
    
    let slope = (a.y-b.y) / (a.x-b.x)
    let yInterCept = a.y - slope*a.x
    
    if point.y == point.x*slope + yInterCept{
        if min(a.x, b.x) <= point.x && point.x <= max(a.x, b.x) && min(a.y, b.y) <= point.y && point.y <= max(a.y, b.y){
            return true
        }
    }
    
    return false
}

func distance(from a:(x:Int, y:Int), to b:(x:Int, y:Int)) -> Int{
    return ((a.x-b.x)*(a.x-b.x)) + ((a.y-b.y)*(a.y-b.y))
}

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    city.append((x,y))
    check.insert([x,y])
}

for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    let A = root(of: u)
    let B = root(of: v)
    
    if A != B{
        arr[B] = A
    }
}

for u in 0..<N-1{
    for v in u+1..<N{
        let cost = distance(from: city[u], to: city[v])
        edges.append((u,v,cost))
    }
}

edges.sort(by: {$0.cost < $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, with: edge.v, cost: edge.cost)
}
print(ans)