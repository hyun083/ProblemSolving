import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let (Hx,Hy) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
let (Ex,Ey) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
var ans = -1

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: 2)

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(line)
}

func bfs(){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    var q = [(x:Int, y:Int, wand:Bool, cnt:Int)]()
    var idx = 0
    
    q.append((Hx,Hy,false,0))
    while idx < q.count{
        let curr = q[idx]
        
        if curr.x == Ex && curr.y == Ey {
            ans = curr.cnt
            return
        }
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M { continue }
            
            if curr.wand{
                if map[nx][ny]==0 && !visited[1][nx][ny]{
                    visited[1][nx][ny] = true
                    q.append((nx,ny,curr.wand,curr.cnt+1))
                }
            }else{
                if map[nx][ny]==1 && !visited[1][nx][ny]{
                    visited[1][nx][ny] = true
                    q.append((nx,ny,true,curr.cnt+1))
                }else if map[nx][ny]==0 && !visited[0][nx][ny]{
                    visited[0][nx][ny] = true
                    q.append((nx,ny,curr.wand,curr.cnt+1))
                }
            }
        }
        
        idx += 1
    }
}
bfs()
print(ans)