import Foundation

let INF = Int.max
var RC = readLine()!.split(separator: " ").map{Int($0)!}
let R1 = RC[0]
let C1 = RC[1]

RC = readLine()!.split(separator: " ").map{Int($0)!}
let R2 = RC[0]
let C2 = RC[1]

let ddx = [[-1,-2,-3],[-1,-2,-3],[0,-1,-2],[0,1,2],[1,2,3],[1,2,3],[0,1,2],[0,-1,-2]]
let ddy = [[0,-1,-2],[0,1,2],[1,2,3],[1,2,3],[0,1,2],[0,-1,-2],[-1,-2,-3],[-1,-2,-3]]

var idx = 0
var q = [(x:Int, y:Int, cnt:Int)]()
var visited = Array(repeating: Array(repeating: INF, count: 9), count: 10)
q.append((R1,C1,0))
visited[R1][C1] = 0

while idx < q.count {
    let curr = q[idx]
    
    for i in 0..<8{
        let dx = ddx[i]
        let dy = ddy[i]
        var invalid = false
        
        for i in 0..<2{
            if curr.x+dx[i] == R2 && curr.y+dy[i] == C2{
                invalid = true
            }
        }
        if invalid{ continue }
        
        let nx = curr.x + dx[2]
        let ny = curr.y + dy[2]
        if nx<0 || ny<0 || nx>9 || ny>8{ continue }
        if visited[nx][ny] > curr.cnt+1 {
            visited[nx][ny] = curr.cnt+1
            q.append((nx,ny,curr.cnt+1))
        }
    }
    idx += 1
}
let res = visited[R2][C2]
print(res==INF ? -1:res)