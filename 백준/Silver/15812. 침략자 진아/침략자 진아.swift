import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var townCnt = 0

var map = [[Int]]()
for _ in 0..<N{
    let info = readLine()!.map{Int(String($0))!}
    map.append(info)
    townCnt += info.reduce(0, +)
}

func bfs(x1:Int, y1:Int, x2:Int, y2:Int) -> Int{
    var cnt = townCnt
    var visited = Array(repeating: Array(repeating: Int.max, count: M), count: N)
    var idx = 0
    var q = [(x:Int, y:Int, cnt:Int)]()
    var res = 0
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    q.append((x1,y1,0))
    q.append((x2,y2,0))
    
    visited[x1][y1] = 0
    visited[x2][y2] = 0

    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            if nx<0 || ny<0 || nx>=N || ny>=M{ continue }
            
            if visited[nx][ny] > curr.cnt+1{
                visited[nx][ny] = curr.cnt+1
                q.append((nx,ny,curr.cnt+1))
                if map[nx][ny] == 1{
                    cnt -= 1
                    res = max(res, visited[nx][ny])
                }
            }
        }
        if cnt == 0 { break }

        idx += 1
    }
    
    return res
}
var ans = N*M
for i in 0..<N*M-1{
    for k in 1+1..<N*M{
        let x1 = i/M
        let y1 = i%M
        let x2 = k/M
        let y2 = k%M
        if map[x1][y1]==0 && map[x2][y2]==0{
            let res = bfs(x1: x1, y1: y1, x2: x2, y2: y2)
            ans = min(ans, res)
        }
    }
}
print(ans)