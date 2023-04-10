import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n{
    let glacier = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<m{
        map[i][k] = glacier[k]
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func melting(x:Int,y:Int){
    for i in 0..<4{
        let nx = x+dx[i]
        let ny = y+dy[i]
        if nx<0 || nx>=n || ny<0 || ny>=m || visited[nx][ny] {continue}
        if map[nx][ny] == 0 {map[x][y] -= 1}
    }
    if map[x][y]<0 {map[x][y] = 0}
}

func bfs(i:Int, k:Int){
    var q = [[i,k]]
    var dq = [[Int]]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            melting(x: x, y: y)
            
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m{continue}
                if !visited[nx][ny] && map[nx][ny] > 0 {
                    visited[nx][ny] = true
                    q.append([nx,ny])
                }
            }
        }
    }
}

var cnt = 0
var year = 0
var flag = true

while cnt < 2{
    year += 1
    cnt = 0
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    for i in 0..<n{
        for k in 0..<m{
            if !visited[i][k] && map[i][k]>0{
                cnt += 1
                visited[i][k] = true
                bfs(i: i, k: k)
            }
        }
    }
    if cnt == 0{
        flag = false
        break
    }
}
if flag{
    print(year-1)
}else{
    print(0)
}