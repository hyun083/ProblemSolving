import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

func bfs(rx:Int, ry:Int){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var idx = 0
    var q = [(x:Int, y:Int)]()
    
    q.append((rx,ry))
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || ny<0 || nx>=N || ny>=M || visited[nx][ny]{
                continue
            }
            
            if abs(map[curr.x][curr.y] - map[nx][ny]) <= K{
                visited[nx][ny] = true
                q.append((nx,ny))
            }
        }
        idx += 1
    }
}

var ans = 0
for i in 0..<N{
    for k in 0..<M{
        if !visited[i][k]{
            visited[i][k] = true
            bfs(rx: i, ry: k)
            ans += 1
        }
    }
}
print(ans)