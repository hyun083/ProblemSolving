import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var before = [[Int]]()
var after = [[Int]]()

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    before.append(line)
}

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    after.append(line)
}

func bfs(x:Int, y:Int, target:Int){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q = [(x:Int, y:Int)]()
    var idx = 0
    
    q.append((x,y))
    visited[x][y] = true
    
    while idx<q.count{
        let curr = q[idx]
        let origin = before[curr.x][curr.y]
        before[curr.x][curr.y] = target
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M || visited[nx][ny]{ continue }
            if before[nx][ny] == origin{
                visited[nx][ny] = true
                q.append((nx,ny))
            }
        }
        
        idx += 1
    }
}

var flag = false
for i in 0..<N{
    for k in 0..<M{
        if before[i][k] != after[i][k]{
            bfs(x: i, y: k, target: after[i][k])
            flag = true
            break
        }
    }
    if flag { break }
}

print(before==after ? "YES":"NO")