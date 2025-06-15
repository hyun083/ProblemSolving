import Foundation

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Int.max, count: 5), count: 5)

for _ in 0..<5{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}
let RC = readLine()!.split(separator: " ").map{Int($0)!}
let R = RC[0]
let C = RC[1]

func bfs(x:Int, y:Int){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q = [(x:Int, y:Int, cost:Int)]()
    var idx = 0
    q.append((x,y,0))
    
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx < 0 || nx >= 5 || ny < 0 || ny >= 5 || map[nx][ny]<0{
                continue
            }
            if visited[nx][ny] > curr.cost + 1{
                visited[nx][ny] = curr.cost + 1
                q.append((nx,ny,curr.cost + 1))
            }
        }
        idx += 1
    }
}

bfs(x: R, y: C)
var ans = -1
for i in 0..<5{
    for k in 0..<5{
        if map[i][k] == 1{
            ans = visited[i][k]
        }
    }
}
print(ans==Int.max ? -1:ans)