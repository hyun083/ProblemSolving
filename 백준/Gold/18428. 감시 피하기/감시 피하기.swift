import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: "", count: N), count: N)
var tq = [(x:Int, y:Int, dir:Int)]()
var blank = [(x:Int, y:Int)]()

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    arr[i] = info
    for k in 0..<N{
        if arr[i][k]=="T"{
            tq.append((i,k,0))
            tq.append((i,k,1))
            tq.append((i,k,2))
            tq.append((i,k,3))
        }else if arr[i][k]=="X"{
            blank.append((i,k))
        }
    }
}

func bfs(on map:[[String]]) -> Bool{
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    let q = tq
    var idx = 0
    
    while idx<q.count{
        let curr = q[idx]
        var nx = curr.x + dx[curr.dir]
        var ny = curr.y + dy[curr.dir]
        
        while 0<=nx && nx<N && 0<=ny && ny<N{
            if map[nx][ny]=="O"{ break }
            if map[nx][ny] == "S"{ return false }
            nx += dx[curr.dir]
            ny += dy[curr.dir]
        }
        
        idx += 1
    }
    
    return true
}

var ans = "NO"
for i in 0..<blank.count-2{
    for k in i+1..<blank.count-1{
        for p in k+1..<blank.count{
            var tmp = arr
            tmp[blank[i].x][blank[i].y] = "O"
            tmp[blank[k].x][blank[k].y] = "O"
            tmp[blank[p].x][blank[p].y] = "O"
            if bfs(on: tmp){
                ans = "YES"
            }
        }
    }
}
print(ans)