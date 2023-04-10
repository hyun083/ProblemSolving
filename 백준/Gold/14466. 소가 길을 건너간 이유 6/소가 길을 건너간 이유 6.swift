import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let N = line[0]
let K = line[1]
let R = line[2]

var map = Array(repeating: Array(repeating: Array(repeating: true, count: 4), count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for _ in 0..<R{
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    let ux = line[0]
    let uy = line[1]
    let vx = line[2]
    let vy = line[3]
    
    for i in 0..<4{
        let nx = ux + dx[i]
        let ny = uy + dy[i]
        if nx == vx && ny == vy{
            map[ux][uy][i] = false
        }
    }
    for i in 0..<4{
        let nx = vx + dx[i]
        let ny = vy + dy[i]
        if nx == ux && ny == uy{
            map[vx][vy][i] = false
        }
    }
}

var ans = 0
var cows = [(Int,Int)]()
for _ in 0..<K{
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    cows.append((line[0],line[1]))
}

func bfs(x:Int, y:Int){
    var q = [(x,y)]
    var idx = 0
    visited[x][y] = true
    
    while idx < q.count{
        let curr = q[idx]
        let x = curr.0
        let y = curr.1
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            if !map[x][y][i]{ continue }
            if nx<0 || nx>=N || ny<0 || ny>=N{ continue }
            if !visited[nx][ny]{
                visited[nx][ny] = true
                q.append((nx,ny))
            }
        }
        idx += 1
    }
}

for i in 0..<K-1{
    let cow = cows[i]
    visited = Array(repeating: Array(repeating: false, count: N), count: N)
    bfs(x: cow.0, y: cow.1)
    for p in i+1..<K{
        if !visited[cows[p].0][cows[p].1]{
            ans += 1
        }
    }
}
print(ans)