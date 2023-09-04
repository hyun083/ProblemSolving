import Foundation

let (r,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: Array(repeating: "", count: c), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
var ans = 0

for i in 0..<r{
    map[i] = readLine()!.map{String($0)}
}

func bfs(from x:Int, y:Int) -> Int{
    visited = Array(repeating: Array(repeating: false, count: c), count: r)
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q = [(x:Int, y:Int, time:Int)]()
    var idx = 0
    var res = 0
    
    visited[x][y] = true
    q.append((x,y,0))
    
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="W"{ continue }
            
            if !visited[nx][ny]{
                visited[nx][ny] = true
                res = max(res, curr.time+1)
                q.append((nx,ny,curr.time+1))
            }
        }
        
        idx += 1
    }
    
    return res
}

for i in 0..<r{
    for k in 0..<c{
        if map[i][k] == "L"{
            ans = max(ans, bfs(from: i, y: k))
        }
    }
}
print(ans)