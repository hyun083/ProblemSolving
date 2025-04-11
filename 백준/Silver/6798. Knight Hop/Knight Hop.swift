import Foundation

let dep = readLine()!.split(separator: " ").map{Int($0)!-1}
let des = readLine()!.split(separator: " ").map{Int($0)!-1}
var visited = Array(repeating: Array(repeating: 8*8, count: 8), count: 8)

func dfs(rx:Int, ry:Int){
    let dx = [-2,-1,1,2,2,1,-1,-2]
    let dy = [1,2,2,1,-1,-2,-2,-1]
    
    for i in 0..<8{
        let nx = rx + dx[i]
        let ny = ry + dy[i]
        
        if nx<0 || nx>=8 || ny<0 || ny>=8{ continue }
        
        if visited[nx][ny] > visited[rx][ry]+1{
            visited[nx][ny] = visited[rx][ry]+1
            dfs(rx: nx, ry: ny)
        }
    }
}

visited[dep[0]][dep[1]] = 0
dfs(rx: dep[0], ry: dep[1])
print(visited[des[0]][des[1]])