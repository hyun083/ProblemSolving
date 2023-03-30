import Foundation

let mn = readLine()!.split(separator: " ").map{Int($0)!}
let m = mn[0]
let n = mn[1]

var map = Array(repeating: Array(repeating: 0, count: n), count: m)
var dp = Array(repeating: Array(repeating: -1, count: n), count: m)
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for i in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<n{
        map[i][k] = line[k]
    }
}

func dfs(x:Int, y:Int) -> Int{
    if x==m-1 && y==n-1{
        return 1
    }else if dp[x][y] == -1{
        dp[x][y] = 0
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            if nx<0 || nx>=m || ny<0 || ny>=n{ continue }
            if map[nx][ny] < map[x][y]{
                dp[x][y] += dfs(x: nx, y: ny)
            }
        }
    }
    
    return dp[x][y]
}

print(dfs(x: 0, y: 0))