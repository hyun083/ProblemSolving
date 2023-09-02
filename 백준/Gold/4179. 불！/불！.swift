import Foundation

let rc = readLine()!.split(separator: " ").map{Int($0)!}
let r = rc[0]
let c = rc[1]

var j = [(x:Int,y:Int,time:Int,isFire:Bool)]()
var f = [(x:Int,y:Int,time:Int,isFire:Bool)]()
var map = Array(repeating: Array(repeating: "", count: c), count: r)
var time = Array(repeating: Array(repeating: 0, count: c), count: r)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: 2)
var ans = Int.max

for i in 0..<r{
    let input = readLine()!.map{String($0)}
    for k in 0..<c{
        map[i][k] = input[k]
        if map[i][k] == "J"{
            j.append((i,k,0,false))
            visited[0][i][k] = true
        }else if map[i][k] == "F"{
            f.append((i,k,0,true))
            visited[1][i][k] = true
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

var q = f+j
var idx = 0

while idx < q.count{
    let curr = q[idx]
    
    if curr.isFire{
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="#"{ continue }
            if !visited[1][nx][ny]{
                visited[1][nx][ny] = true
                time[nx][ny] = curr.time+1
                q.append((nx,ny,curr.time+1,true))
            }
        }
    }else{
        if curr.x==0 || curr.x==r-1 || curr.y==0 || curr.y==c-1{ ans = min(ans, curr.time+1) }
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="#"{ continue }
            
            if !visited[0][nx][ny]{
                if !visited[1][nx][ny]{
                    visited[0][nx][ny] = true
                    q.append((nx,ny,curr.time+1,false))
                }else if time[nx][ny] > curr.time+1{
                    visited[0][nx][ny] = true
                    q.append((nx,ny,curr.time+1,false))
                }
            }
        }
    }
    
    idx += 1
}

print(ans == Int.max ? "IMPOSSIBLE":ans)