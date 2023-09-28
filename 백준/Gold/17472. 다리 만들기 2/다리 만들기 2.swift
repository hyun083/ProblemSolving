import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [Int]()
var land = 0
var map = Array(repeating: Array(repeating: Int(), count: M), count: N)
var edges = [(u:Int, v:Int, cost:Int)]()
var ans = 0
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var L = [(x:Int, y:Int)]()

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map[i] = info
}

func indexing(from root:(x:Int, y:Int), index:Int){
    var q = [root]
    var idx = 0
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    map[root.x][root.y] = index
    visited[root.x][root.y] = true
    
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M || visited[nx][ny] || map[nx][ny]==0{ continue }
            visited[nx][ny] = true
            map[nx][ny] = index
            q.append((nx,ny))
        }
        
        idx += 1
    }
}

func bfs(from root:(x:Int, y:Int)){
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q = [(root:(x:Int, y:Int), pos:(x:Int, y:Int), length:Int, dir:Int)]()
    var idx = 0
    
    visited[root.x][root.y] = true
    q.append((root, root, 0, 0))
    q.append((root, root, 0, 1))
    q.append((root, root, 0, 2))
    q.append((root, root, 0, 3))
    
    while idx < q.count{
        let curr = q[idx]
        
        let nx = curr.pos.x + dx[curr.dir]
        let ny = curr.pos.y + dy[curr.dir]
        
        if nx<0 || nx>=N || ny<0 || ny>=M || visited[nx][ny]{
            idx += 1
            continue
        }
        
        visited[nx][ny] = true
        if map[nx][ny] > 0{
            let u = map[curr.root.x][curr.root.y]-1
            let v = map[nx][ny]-1
            
            if curr.length >= 2 && u != v{
                edges.append((u,v,curr.length))
            }
        }else{
            q.append((root, (nx,ny), curr.length+1, curr.dir))
        }
        
        idx += 1
    }
}

func root(of node:Int) -> Int{
    if arr[node] < 0 {
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B{ return }
    arr[B] = A
    land -= 1
    ans += cost
}

for i in 0..<N{
    for k in 0..<M{
        if map[i][k] == 1 && !visited[i][k]{
            L.append((i,k))
            land += 1
            indexing(from: (i,k), index: land)
            arr.append(-1)
        }
    }
}

for i in 0..<N{
    for k in 0..<M{
        if map[i][k]>0{
            bfs(from: (i,k))
        }
    }
}

edges.sort(by: {$0.cost > $1.cost})
while land>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(land>1 ? -1:ans)