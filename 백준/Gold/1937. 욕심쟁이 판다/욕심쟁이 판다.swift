import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
var cnt = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n{
    map[i] = readLine()!.split(separator: " ").map{Int($0)!}
}

func dfs(x:Int, y:Int) -> Int{
    if !visited[x][y] {
        visited[x][y] = true
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx<0 || nx>=n || ny<0 || ny>=n { continue }
            if map[nx][ny] > map[x][y]{
                cnt[x][y] = max(cnt[x][y], dfs(x: nx, y: ny))
            }
        }
    }
    
    return cnt[x][y]+1
}

var ans = 0
for i in 0..<n{
    for k in 0..<n{
        ans = max(ans,dfs(x: i, y: k))
    }
}
print(ans)