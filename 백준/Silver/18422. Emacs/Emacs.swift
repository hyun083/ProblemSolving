import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = [[String]]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

for _ in 0..<N{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

func dfs(x: Int, y: Int){
    visited[x][y] = true
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for i in 0..<4{
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx<0 || ny<0 || nx>=N || ny>=M || map[nx][ny]=="."{ continue }
        if !visited[nx][ny]{
            visited[nx][ny] = true
            dfs(x: nx, y: ny)
        }
    }
}
var ans = 0
for i in 0..<N{
    for k in 0..<M{
        if !visited[i][k] && map[i][k]=="*"{
            ans += 1
            dfs(x: i, y: k)
        }
    }
}
print(ans)