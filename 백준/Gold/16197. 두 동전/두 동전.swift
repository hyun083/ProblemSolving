import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: Array(repeating: "", count: M), count: N)
//var visited = Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: 2)
var coins = [(x:Int, y:Int)]()

for i in 0..<N{
    let info = readLine()!.map{String($0)}
    map[i] = info
    for k in 0..<M{
        if map[i][k] == "o"{
            coins.append((i,k))
        }
    }
}

var idx = 0
var q = [(coin1:(x:Int, y:Int), coin2:(x:Int, y:Int), cnt:Int)]()
q.append((coins[0], coins[1], 0))
//visited[0][coins[0].x][coins[0].y] = true
//visited[1][coins[1].x][coins[1].y] = true

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var ans = 11

while idx < q.count{
    let curr = q[idx]
    if curr.cnt >= 10 { break }
    for i in 0..<4{
        var nx1 = curr.coin1.x + dx[i]
        var ny1 = curr.coin1.y + dy[i]
        
        var nx2 = curr.coin2.x + dx[i]
        var ny2 = curr.coin2.y + dy[i]
        
        if (nx1<0 || N<=nx1 || ny1<0 || M<=ny1) && (nx2<0 || N<=nx2 || ny2<0 || M<=ny2){
            continue
        }
        
        if (0<=nx1 && nx1<N && 0<=ny1 && ny1<M) && (0<=nx2 && nx2<N && 0<=ny2 && ny2<M){
//            if visited[0][nx1][ny1] && visited[1][nx2][ny2]{ continue }
            if map[nx1][ny1]=="#" && map[nx2][ny2]=="#"{ continue }
            if map[nx1][ny1] == "#"{
                nx1 -= dx[i]
                ny1 -= dy[i]
            }else if map[nx2][ny2] == "#"{
                nx2 -= dx[i]
                ny2 -= dy[i]
            }
//            visited[0][nx1][ny1] = true
//            visited[1][nx2][ny2] = true
            q.append(((nx1,ny1),(nx2,ny2), curr.cnt+1))
        }else{
            ans = min(ans, curr.cnt+1)
//            print(curr,i, ans)
        }
    }
    
    idx += 1
}

print(ans>10 ? -1:ans)