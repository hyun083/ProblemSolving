import Foundation

let n = Int(readLine()!)!
let (r1,c1,r2,c2) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1],$0[2],$0[3])}[0]

let dx = [-2,-2,0,0,2,2]
let dy = [-1,1,-2,2,-1,1]
var ans = -1

func bfs(){
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var q = [(x:Int, y:Int, cnt:Int)]()
    var idx = 0
    
    q.append((r1,c1,0))
    visited[r1][c1] = true
    
    while idx < q.count{
        let curr = q[idx]
        if curr.x==r2 && curr.y==c2{
            ans = curr.cnt
            return
        }
        
        for i in 0..<6{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=n || ny<0 || ny>=n{ continue }
            if !visited[nx][ny]{
                visited[nx][ny] = true
                q.append((nx,ny,curr.cnt+1))
            }
        }
        
        idx += 1
    }
}
bfs()
print(ans)