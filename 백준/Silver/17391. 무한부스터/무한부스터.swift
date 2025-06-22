import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Int.max, count: M), count: N)
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

var idx = 0
var q = [(x:Int, y:Int, cnt:Int)]()
q.append((0,0,0))
visited[0][0] = 0

while idx < q.count{
    let curr = q[idx]
    
    for dx in 1...map[curr.x][curr.y]{
        let nx = curr.x + dx
        if nx<0 || nx>=N{
            continue
        }
        if visited[nx][curr.y] > curr.cnt+1{
            visited[nx][curr.y] = curr.cnt+1
            q.append((nx,curr.y,curr.cnt+1))
        }
    }
    for dy in 1...map[curr.x][curr.y]{
        let ny = curr.y + dy
        if ny<0 || ny>=M{
            continue
        }
        if visited[curr.x][ny] > curr.cnt+1{
            visited[curr.x][ny] = curr.cnt+1
            q.append((curr.x, ny, curr.cnt+1))
        }
    }

    idx += 1
}
print(visited[N-1][M-1])