import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var ans = 20001

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

func dfs(x:Int, y:Int, arr:[(x:Int,y:Int)]){
    if x==N{ return }
    var q = arr
    if q.count == 3{
        var sum = 0
        var visited = Array(repeating: Array(repeating: false, count: N), count: N)
        for i in 0..<3{
            let curr = q[i]
            if visited[curr.x][curr.y] { return }
            visited[curr.x][curr.y] = true
            sum += map[curr.x][curr.y]
            
            for i in 0..<4{
                let nx = curr.x + dx[i]
                let ny = curr.y + dy[i]
                
                if nx<0 || nx>=N || ny<0 || ny>=N || visited[nx][ny]{ return }
                visited[nx][ny] = true
                sum += map[nx][ny]
            }
        }
        ans = min(ans, sum)
        return
    }
    
    for i in 0..<N{
        for k in 0..<N{
            q.append((i,k))
            dfs(x: k+1==N ? i+1:i, y: k+1==N ? 0:k+1, arr: q)
            q.removeLast()
        }
    }
}
dfs(x: 0, y: 0, arr: [])
print(ans)