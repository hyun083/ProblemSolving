import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [Double](), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Double($0)!}
    var tmp = 0.0
    for k in 0..<3*M{
        tmp += info[k]
        if (k+1)%3 == 0{
            map[i].append(tmp/3)
            tmp = 0
        }
    }
}
let T = Double(readLine()!)!

func bfs(rx:Int, ry:Int){
    var q = [(x:Int, y:Int)]()
    var idx = 0
    q.append( (x:rx, y:ry) )
    visited[rx][ry] = true
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    while idx < q.count{
        let curr = q[idx]
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            if nx<0 || ny<0 || nx>=N || ny>=M{ continue }
            if map[nx][ny] < T { continue }
            if !visited[nx][ny]{
                visited[nx][ny] = true
                q.append((nx,ny))
            }
        }
        idx += 1
    }
}
var ans = 0
for i in 0..<N{
    for k in 0..<M{
        if !visited[i][k] && map[i][k] >= T{
            bfs(rx: i, ry: k)
            ans += 1
        }
    }
}
print(ans)