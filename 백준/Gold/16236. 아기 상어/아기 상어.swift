import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var shark = (x:0,y:0)

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<n{
        map[i][k] = line[k]
        if map[i][k]==9{
            map[i][k] = 0
            shark.x = i
            shark.y = k
        }
    }
}

var time = 0
var size = 2
let dx = [-1,0,0,1]
let dy = [0,-1,1,0]
var cnt = 0
func bfs(x:Int, y:Int, t:Int) -> (x:Int,y:Int,t:Int){
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var q = [(x,y,t)]
    var fish = [(x:Int,y:Int,t:Int)]()
    var idx = 0
    visited[x][y] = true
    while idx<q.count{
        let curr = q[idx]
        let x = curr.0
        let y = curr.1
        let t = curr.2
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            let nt = t+1
            if nx<0 || nx>=n || ny<0 || ny>=n{continue}
            if map[nx][ny]<=size && !visited[nx][ny]{
                visited[nx][ny] = true
                if 0<map[nx][ny] && map[nx][ny]<size{
                    fish.append((nx,ny,nt))
                    continue
                }
                q.append((nx,ny,nt))
            }
        }
        
        idx+=1
    }
    if !fish.isEmpty{
        fish = fish.sorted(by: {
            if $0.t == $1.t{
                if $0.x == $1.x{
                    return $0.y < $1.y
                }else{
                    return $0.x < $1.x
                }
            }else{
                return $0.t < $1.t
            }
        })
        let destination = fish.first!
        map[destination.x][destination.y] = 0
        cnt += 1
        if cnt == size{
            size += 1
            cnt = 0
        }
        return destination
    }
    return (x,y,t)
}

while true{
    let movedShark = bfs(x: shark.x, y: shark.y, t: 0)
    if movedShark.x==shark.x && movedShark.y==shark.y{
        break
    }else{
        shark.x = movedShark.x
        shark.y = movedShark.y
        time += movedShark.t
    }
}
print(time)