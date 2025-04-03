import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: M)
var ans = "No"

for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}
func bfs(start:(x:Int,y:Int),end:(x:Int,y:Int)){
    let dx = [1,0]
    let dy = [0,1]
    
    var q = [(x:Int,y:Int)]()
    var idx = 0
    
    q.append(start)
    visited[start.x][start.y] = true
    
    while idx < q.count{
        let curr = q[idx]
        
        if curr == end{
            ans = "Yes"
            return
        }
        
        for i in 0..<2{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            if nx<0 || ny<0 || nx>=M || ny>=N || map[nx][ny]==0{ continue }
            
            if !visited[nx][ny]{
                visited[nx][ny] = true
                q.append((x:nx,y:ny))
            }
        }
        idx += 1
    }
}

bfs(start: (0,0), end: (M-1,N-1))
print(ans)