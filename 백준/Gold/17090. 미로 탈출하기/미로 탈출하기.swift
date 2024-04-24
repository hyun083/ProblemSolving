import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: Array(repeating: -1, count: M), count: N)
var map = [[String]]()
var ans = 0

for _ in 0..<N{
    let line = readLine()!.map{String($0)}
    map.append(line)
}

func dfs(x:Int, y:Int) -> Int{
    var nx = x
    var ny = y
    
    if map[x][y] == "U"{
        nx -= 1
    }else if map[x][y] == "R"{
        ny += 1
    }else if map[x][y] == "D"{
        nx += 1
    }else if map[x][y] == "L"{
        ny -= 1
    }
    
    if nx<0 || nx>=N || ny<0 || ny>=M {
        return 1
    }
    if visited[nx][ny] > -1{
        return visited[nx][ny]
    }
    visited[nx][ny] = 0
    visited[nx][ny] = dfs(x: nx, y: ny)
    return visited[nx][ny]
}

for i in 0..<N{
    for k in 0..<M{
        ans += dfs(x: i, y: k)
    }
}
print(ans)