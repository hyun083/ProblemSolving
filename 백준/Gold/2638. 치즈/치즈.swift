import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let N = nm[0]
let M = nm[1]

var cheeze = 0
var map = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<M{
        if line[k] == 1{
            map[i][k] = 1
            cheeze += 1
        }
    }
}

func melting(){
    var set = Set<[Int]>()
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    visited[0][0] = true
    var q = [(x:0,y:0)]
    var idx = 0
    let dx = [1,-1,0,0]
    let dy = [0,0,-1,1]
    
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M || visited[nx][ny]{ continue }
            if map[nx][ny] == 0{
                visited[nx][ny] = true
                q.append((nx,ny))
            }else{
                if set.contains([nx,ny]){
                    map[nx][ny] = 0
                    visited[nx][ny] = true
                    cheeze -= 1
                }else{
                    set.insert([nx,ny])
                }
            }
        }
        idx += 1
    }
}
var count = 0
while cheeze > 0{
    count += 1
    melting()
}
print(count)