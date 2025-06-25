import Foundation

let RC = readLine()!.split(separator: " ").map{Int($0)!}
let R = RC[0]
let C = RC[1]
var map = [[Int]]()

for _ in 0..<R{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

let N = Int(readLine()!)!
var dx = [Int]()
var dy = [Int]()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    dx.append(info[0])
    dy.append(info[1])
}

func bfs() -> Int{
    var visited = Array(repeating: Array(repeating: Int.max, count: C), count: R)
    var idx = 0
    var q = [(x:Int, y:Int, cnt:Int)]()
    
    for i in 0..<C{
        if map[0][i] == 1{
            q.append((0,i,0))
            visited[0][i] = 0
        }
    }
    
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<N{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || ny<0 || nx>=R || ny>=C || map[nx][ny]==0{ continue }
            if visited[nx][ny] > curr.cnt+1{
                visited[nx][ny] = curr.cnt+1
                q.append((nx,ny,curr.cnt+1))
            }
        }
        idx += 1
    }
    var res = Int.max
    for i in 0..<C{
        if map[R-1][i] == 1{
            res = min(res, visited[R-1][i])
        }
    }
    return res == Int.max ? -1 : res
}
print(bfs())