import Foundation

func root(of node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B {return}
    
    arr[B] = A
    ans = max(ans, cost)
}

let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: N*N)
var cost = [[Int]]()
var q = [(u:Int, v:Int, cost:Int)]()
var ans = 0

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    cost.append(info)
}

let dx = [1,0]
let dy = [0,1]

for x in 0..<N{
    for y in 0..<N{
        for i in 0..<2{
            let nx = x+dx[i]
            let ny = y+dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=N{ continue }
            
            let u = x*N+y
            let v = nx*N+ny
            let cost = abs(cost[x][y] - cost[nx][ny])
            
            q.append((u,v,cost))
        }
    }
}
q.sort(by: {$0.cost > $1.cost})

while root(of: 0) != root(of: N*N-1){
    let edge = q.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(ans)