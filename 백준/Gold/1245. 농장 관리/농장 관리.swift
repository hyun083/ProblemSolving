import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: Array(repeating:0, count:m), count:n)
var visited = Array(repeating:Array(repeating:false, count:m), count:n)
var ans = 0

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    for k in 0..<m{
        map[i][k] = line[k]
        if map[i][k] == 0{ visited[i][k] = true }
    }
}

let dx = [-1,-1,0,1,1,1,0,-1]
let dy = [0,1,1,1,0,-1,-1,-1]
func bfs(x:Int, y:Int){
    var flag = true
    var q = [[x,y]]
    var dq = [[Int]]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            
            for i in 0..<8{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m { continue }
                if map[nx][ny] == map[x][y]{
                    if !visited[nx][ny]{
                        visited[nx][ny] = true
                        q.append([nx,ny])
                    }
                }else if map[nx][ny] > map[x][y]{
                    flag = false
                }
            }
            
        }
    }
    if flag{
        ans += 1
    }
}

for i in 0..<n{
    for k in 0..<m{
        if !visited[i][k]{
            visited[i][k] = true
            bfs(x: i, y: k)
        }
    }
}

print(ans)