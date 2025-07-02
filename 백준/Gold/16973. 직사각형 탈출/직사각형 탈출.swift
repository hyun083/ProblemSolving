import Foundation

let INF = Int.max
let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: INF, count: M), count: N)

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

let info = readLine()!.split(separator: " ").map{Int($0)!}
let H = info[0]
let W = info[1]
let ux = info[2] - 1
let uy = info[3] - 1
let vx = info[4] - 1
let vy = info[5] - 1

var idx = 0
var q = [(x:Int, y:Int, cnt:Int)]()
q.append((ux,uy,0))

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func targetCanMove(x:Int, y:Int, dir:Int) -> Bool{
    var res = true
    
    switch dir{
    case 0:
        if x-1 < 0{
            res = false
        }else{
            for ny in y..<y+W{
                if map[x-1][ny] == 1{ res = false }
            }
        }
        break
    case 1:
        if x+H >= N{
            res = false
        }else{
            for ny in y..<y+W{
                if map[x+H][ny] == 1{ res = false }
            }
        }
        break
    case 2:
        if y-1 < 0{
            res = false
        }else{
            for nx in x..<x+H{
                if map[nx][y-1] == 1{ res = false }
            }
        }
        break
    case 3:
        if y+W >= M{
            res = false
        }else{
            for nx in x..<x+H{
                if map[nx][y+W] == 1{ res = false }
            }
        }
        break
    default :
        break
    }
    
    return res
}

while idx < q.count{
    let curr = q[idx]
    for i in 0..<4{
        if targetCanMove(x: curr.x, y: curr.y, dir: i){
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            if visited[nx][ny] > curr.cnt+1{
                visited[nx][ny] = curr.cnt+1
                q.append((nx,ny,curr.cnt+1))
            }
        }
    }
    idx += 1
}
let ans = visited[vx][vy]
print(ans == INF ? -1:ans)