import Foundation

let mn = readLine()!.split(separator: " ").map{Int($0)!}
let m = mn[0]
let n = mn[1]
var map = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)

for i in 0..<m{
    let line = readLine()!.map{Int(String($0))!}
    for k in 0..<n{
        map[i][k] = line[k]
        if map[i][k] == 1{
            visited[i][k] = true
        }
    }
}

var ans = "NO"
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func bfs(x:Int, y:Int){
    var q = [(x,y)]
    var idx = 0
    while idx < q.count{
        let x = q[idx].0
        let y = q[idx].1
        
        if x==m-1{ ans = "YES" }
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            if nx<0 || nx>=m || ny<0 || ny>=n{ continue }
            if !visited[nx][ny]{
                visited[nx][ny] = true
                map[nx][ny] = 2
                q.append((nx,ny))
            }
        }
        idx += 1
    }
}

for k in 0..<n{
    if !visited[0][k]{
        visited[0][k] = true
        map[0][k] = 2
        bfs(x: 0, y: k)
    }
}

print(ans)