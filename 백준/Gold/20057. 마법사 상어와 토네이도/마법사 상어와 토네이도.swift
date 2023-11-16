import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var test = 0
let dx = [0,1,0,-1]
let dy = [-1,0,1,0]
var step = 1
var ans = 0

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

func dfs(x:Int, y:Int, step:Int){
    var nx = x
    var ny = y
    
    if step%2 == 1{
        for _ in 0..<step{
            nx += dx[0]
            ny += dy[0]
            if nx<0 || nx>=N || ny<0 || ny>=N { continue }
            bfs(x: nx, y: ny, dir: 0)
            if nx == 0 && ny == -1 {
                print(nx,ny)
                return
            }
        }
        
        for _ in 0..<step{
            nx += dx[1]
            ny += dy[1]
            if nx<0 || nx>=N || ny<0 || ny>=N { continue }
            bfs(x: nx, y: ny, dir: 1)
        }
    }else{
        for _ in 0..<step{
            nx += dx[2]
            ny += dy[2]
            if nx<0 || nx>=N || ny<0 || ny>=N { continue }
            bfs(x: nx, y: ny, dir: 2)
        }
        
        for _ in 0..<step{
            nx += dx[3]
            ny += dy[3]
            if nx<0 || nx>=N || ny<0 || ny>=N { continue }
            bfs(x: nx, y: ny, dir: 3)
        }
    }
    
    if nx < 0 || nx>=N || ny<0 || ny>=N { return }
    dfs(x: nx, y: ny, step: step+1)
}

func bfs(x:Int, y:Int, dir:Int){
    let ddx = [[0, 0, 1, -1, 1, -1, 2, -2, 1, -1],[1, 2, 1, 1, 0, 0, 0, 0, -1, -1],[0, 0, -1, 1, -1, 1, -2, 2, -1, 1],[-1, -2, -1, -1, 0, 0, 0, 0, 1, 1]]
    let ddy = [[-1, -2, -1, -1, 0, 0, 0, 0, 1, 1],[0, 0, 1, -1, 1, -1, 2, -2, 1, -1],[1, 2, 1, 1, 0, 0, 0, 0, -1, -1],[0, 0, 1, -1, 1, -1, 2, -2, 1, -1]]
    let percent = [0,5,10,10,7,7,2,2,1,1]

    if x<=0 && y<0 { return }
    var remain = 0
    let origin = map[x][y]
    
    for i in 1..<10{
        let nx = x+ddx[dir][i]
        let ny = y+ddy[dir][i]
        map[x][y] -= origin*percent[i]/100
        
        if nx<0 || nx>=N || ny<0 || ny>=N{
            remain += origin*percent[i]/100
        }else{
            map[nx][ny] += origin*percent[i]/100
        }
    }
    
    let ax = x+ddx[dir][0]
    let ay = y+ddy[dir][0]
    if ax<0 || ax>=N || ay<0 || ay>=N{
        remain += map[x][y]
    }else{
        map[ax][ay] += map[x][y]
    }
    map[x][y] = 0
    ans += remain
}

dfs(x: N/2, y: N/2, step: 1)
print(ans)