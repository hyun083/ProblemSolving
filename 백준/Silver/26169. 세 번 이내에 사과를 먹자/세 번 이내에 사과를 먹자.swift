import Foundation

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)

for _ in 0..<5{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}
let dep = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

func btk(x:Int, y:Int, cnt:Int, move:Int){
    if cnt==2{
        ans = 1
        return
    }
    
    if ans==1 || move==3{ return }
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for i in 0..<4{
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx<0 || ny<0 || nx>=5 || ny>=5 || map[nx][ny]<0{ continue }
        
        if !visited[nx][ny]{
            visited[nx][ny] = true
            btk(x: nx, y: ny, cnt: cnt+map[nx][ny], move:move+1)
            visited[nx][ny] = false
        }
    }
}
visited[dep[0]][dep[1]] = true
btk(x: dep[0], y:dep[1], cnt: map[dep[0]][dep[1]],move: 0)
print(ans)