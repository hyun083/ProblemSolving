import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: false, count: N*M)
var map = [[String]]()
var arr = Array(repeating: -1, count: N*M)
var ans = N*M
var DIR = Dictionary<String,(dx:Int, dy:Int)>()

DIR["N"] = (-1,0)
DIR["S"] = (1,0)
DIR["W"] = (0,-1)
DIR["E"] = (0,1)

func root(of node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
    ans -= 1
}

func dfs(from curr:Int){
    let x = curr/M
    let y = curr%M
    let dir = map[x][y]
    
    let nx = x+DIR[dir]!.dx
    let ny = y+DIR[dir]!.dy
    let next = (nx*M)+ny
    
    union(a: curr, b: next)
    if !visited[next] {
        visited[next] = true
        dfs(from: next)
    }
}

for _ in 0..<N{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

for i in 0..<N{
    for k in 0..<M{
        let curr = (i*M)+k
        if !visited[curr]{
            visited[curr] = true
            dfs(from: curr)
        }
    }
}

print(ans)