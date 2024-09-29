import Foundation

let RC = readLine()!.split(separator: " ").map{Int($0)!}
let R = RC[0], C = RC[1]

var map = [[String]]()
var visited = Array(repeating: Array(repeating: false, count: C), count: R)
var ans = 0

for _ in 0..<R{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

func dfs(r: Int, c: Int){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for i in 0..<4{
        let nr = r + dx[i]
        let nc = c + dy[i]
        
        if nr < 0 || nr >= R || nc < 0 || nc >= C{ continue }
        if map[nr][nc] == "."{ continue }
        
        if !visited[nr][nc]{
            visited[nr][nc] = true
            dfs(r: nr, c: nc)
        }
    }
}

for i in 0..<R{
    for k in 0..<C{
        if !visited[i][k] && map[i][k]=="#"{
            ans += 1
            dfs(r: i, c: k)
        }
    }
}

print(ans)