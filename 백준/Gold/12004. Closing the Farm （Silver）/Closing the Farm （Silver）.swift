import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: false, count: N)
var closed = Array(repeating: false, count: N)
var map = Array(repeating: [Int](), count: N)
var arr = Array(repeating: -1, count: N)
var comp = N

func bfs(from node:Int){
    for next in map[node]{
        if closed[next]{ continue }
        else if !visited[next]{
            visited[next] = true
            bfs(from: next)
        }
    }
}

func root(of node:Int) -> Int{
    if arr[node] < 0 { return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[B] = A
    comp -= 1
}

for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    union(a: u, b: v)
    map[u].append(v)
    map[v].append(u)
}
print(comp==1 ? "YES":"NO")

for _ in 0..<N-1{
    visited = Array(repeating: false, count: N)
    let farm = Int(readLine()!)!-1
    closed[farm] = true
    var comp = 0
    
    for i in 0..<N{
        if closed[i] { continue }
        else if !visited[i] {
            visited[i] = true
            bfs(from: i)
            comp += 1
        }
    }
    print(comp==1 ? "YES":"NO")
}