import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var map = [[String]]()
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var ans = "No"

for _ in 0..<N{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

func dfs(from origin:(x:Int,y:Int), curr:(x:Int,y:Int), cnt:Int){
    for i in 0..<4{
        let nx = curr.x+dx[i]
        let ny = curr.y+dy[i]
        
        if nx<0 || nx>=N || ny<0 || ny>=M || map[nx][ny] != map[origin.x][origin.y]{ continue }
        if nx==origin.x && ny==origin.y && cnt>=4{
            ans = "Yes"
            return }
        if visited[nx][ny] { continue }
        visited[nx][ny] = true
        dfs(from: origin, curr: (nx,ny), cnt: cnt+1)
    }
}

for i in 0..<N{
    for k in 0..<M{
        visited = Array(repeating: Array(repeating: false, count: M), count: N)
        visited[i][k] = true
        dfs(from: (i,k), curr: (i,k), cnt: 1)
    }
}
print(ans)