import Foundation

let nmk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nmk[0]
let m = nmk[1]
let k = nmk[2]

var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: -1, count: m), count: n)

for i in 0..<n{
    let input = readLine()!.map{Int(String($0))!}
    for k in 0..<m{
        map[i][k] = input[k]
    }
}
var ans = -1
func bfs(){
    visited[0][0] = 0
    var q = [[0,0,0,1]]
    var dq = [[Int]]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            let wall = curr[2]
            let cnt = curr[3]
            let dx = [-1,1,0,0]
            let dy = [0,0,-1,1]
            
            if x==n-1 && y==m-1{
                ans = cnt
                return
            }
            
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m {continue}
                if wall<k && map[nx][ny]==1{    //벽을 만남
                    if visited[nx][ny]<0 || visited[nx][ny] > wall+1{   //한번도 방문하지 않은 벽, 또는 더 적게부순상태로 지나갈수있다면
                        visited[nx][ny] = wall+1
                        q.append([nx,ny,wall+1,cnt+1])
                    }
                }
                if map[nx][ny]==0{
                    if visited[nx][ny]<0{   //길, 한번도방문하지 않음
                        visited[nx][ny] = wall
                        q.append([nx,ny,wall,cnt+1])
                    }else if visited[nx][ny]>=0 && visited[nx][ny] > wall{  //길, 전에방문했었음, 벽을 더 많이 부순상태로 지나갔었던
                        visited[nx][ny] = wall
                        q.append([nx,ny,wall,cnt+1])
                    }
                }
            }
            
        }
    }
}
bfs()
print(ans)
