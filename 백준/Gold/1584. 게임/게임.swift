import Foundation

var map = Array(repeating: Array(repeating: 0, count: 501), count: 501)
var dist = Array(repeating: Array(repeating: 250001, count: 501), count: 501)
dist[0][0] = 0

for _ in 0..<Int(readLine()!)!{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x1 = info[0]
    let y1 = info[1]
    let x2 = info[2]
    let y2 = info[3]
    for i in min(x1, x2)...max(x1, x2){
        for k in min(y1, y2)...max(y1, y2){
            map[i][k] = 1
        }
    }
}

for _ in 0..<Int(readLine()!)!{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x1 = info[0]
    let y1 = info[1]
    let x2 = info[2]
    let y2 = info[3]
    for i in min(x1, x2)...max(x1, x2){
        for k in min(y1, y2)...max(y1, y2){
            map[i][k] = 2
        }
    }
}


func bfs(){
    var q = [(0,0)]
    var idx = 0
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    while idx < q.count{
        let curr = q[idx]
        let x = curr.0
        let y = curr.1
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            if nx<0 || nx>500 || ny<0 || ny>500 || map[nx][ny]==2{ continue }
            
            if dist[nx][ny] > dist[x][y] + map[nx][ny]{
                dist[nx][ny] = dist[x][y] + map[nx][ny]
                q.append((nx,ny))
            }
        }
        idx += 1
    }
}
bfs()
print(dist[500][500]==250001 ? -1:dist[500][500])