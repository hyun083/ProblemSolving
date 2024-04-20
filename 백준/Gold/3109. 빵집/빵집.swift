import Foundation

let (R,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: Array(repeating: false, count: C), count: R)
var map = [[String]]()

for _ in 0..<R{
    let line = readLine()!.map{String($0)}
    map.append(line)
}

let dx = [-1,0,1]
let dy = [1,1,1]
var ans = 0
var finished = false

func bfs(x:Int, y:Int){
    if y==C-1 {
        ans += 1
        finished = true
        return
    }
    for i in 0..<3{
        let nx = x+dx[i]
        let ny = y+dy[i]
        if finished { return }
        if 0<=nx && nx<R && ny<C && map[nx][ny]=="." && !visited[nx][ny]{
            visited[nx][ny] = true
            bfs(x: nx, y: ny)
        }
    }
}
for i in 0..<R{
    finished = false
    visited[i][0] = true
    bfs(x: i, y: 0)
}
print(ans)