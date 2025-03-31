import Foundation

var map = [[String]]()
var visited = Array(repeating: Array(repeating: 100, count: 10), count: 10)
var destination: (x:Int,y:Int) = (0,0)
var departure: (x:Int,y:Int) = (0,0)

for i in 0..<10{
    let info = readLine()!.map{String($0)}
    map.append(info)
    for k in 0..<10{
        if map[i][k] == "B"{
            destination = (i,k)
        }else if map[i][k] == "L"{
            departure = (i,k)
        }
    }
}

func bfs(from start: (x:Int,y:Int)){
    var q = [(x:Int, y:Int, count:Int)]()
    var idx = 0
    q.append((start.x, start.y, 0))
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    while idx < q.count{
        let curr = q[idx]
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            if nx<0 || ny<0 || nx>=10 || ny>=10 || map[nx][ny]=="R" { continue }
            if visited[nx][ny] > curr.count+1{
                visited[nx][ny] = curr.count+1
                q.append((nx,ny,curr.count+1))
            }
        }
        idx += 1
    }
}

bfs(from: departure)
print(visited[destination.x][destination.y]-1)