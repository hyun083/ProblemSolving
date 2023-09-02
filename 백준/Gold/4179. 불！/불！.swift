import Foundation

let rc = readLine()!.split(separator: " ").map{Int($0)!}
let r = rc[0]
let c = rc[1]

var j = [[Int]]()
var f = [[Int]]()
var map = Array(repeating: Array(repeating: "", count: c), count: r)
var visited = Array(repeating: Array(repeating: 0, count: c), count: r)
var Fcheck = Array(repeating: Array(repeating: false, count: c), count: r)
var Jcheck = Array(repeating: Array(repeating: false, count: c), count: r)
var ans = Int.max

for i in 0..<r{
    let input = readLine()!.map{String($0)}
    for k in 0..<c{
        map[i][k] = input[k]
        if map[i][k] == "J"{
            j.append([i,k,0,0])
            Jcheck[i][k] = true
        }else if map[i][k] == "F"{
            f.append([i,k,0,1])
            Fcheck[i][k] = true
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func bfs(j:[[Int]],f:[[Int]]){
    var q = f+j
    var idx = 0
    
    while idx < q.count{
        let curr = q[idx]
        let x = curr[0]
        let y = curr[1]
        let time = curr[2]
        
        if curr[3] == 0{
            if x==0 || x==r-1 || y==0 || y==c-1{ ans = min(ans, time+1) }
            for i in 0..<4{
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="#"{ continue }

                if !Jcheck[nx][ny]{
                    if !Fcheck[nx][ny]{
                        Jcheck[nx][ny] = true
                        q.append([nx,ny,time+1,0])
                    }else if visited[nx][ny] > time+1{
                        Jcheck[nx][ny] = true
                        q.append([nx,ny,time+1,0])
                    }
                }
            }
        }else{
            for i in 0..<4{
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="#"{ continue }
                if !Fcheck[nx][ny]{
                    Fcheck[nx][ny] = true
                    visited[nx][ny] = time+1
                    q.append([nx,ny,time+1,1])
                }
            }
        }
        
        idx += 1
    }
}
bfs(j: j, f: f)
print(ans == Int.max ? "IMPOSSIBLE":ans)