import Foundation

let (r,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: 2)
var map = Array(repeating: Array(repeating: "", count: c), count: r)
var time = Array(repeating: Array(repeating: 0, count: c), count: r)
var water = [(x:Int, y:Int, time:Int, isWater:Bool)]()
var dochi = [(x:Int, y:Int, time:Int, isWater:Bool)]()
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for i in 0..<r{
    map[i] = readLine()!.map{String($0)}
    for k in 0..<c{
        if map[i][k] == "S"{
            visited[1][i][k] = true
            dochi.append((i,k,0,false))
        }else if map[i][k] == "*"{
            visited[0][i][k] = true
            water.append((i,k,0,true))
        }
    }
}

var q = water + dochi
var idx = 0
var ans = -1

while idx<q.count && ans<0{
    let curr = q[idx]
    
    if curr.isWater{
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="X" || map[nx][ny]=="D"{ continue }
            if !visited[0][nx][ny]{
                visited[0][nx][ny] = true
                time[nx][ny] = curr.time+1
                q.append((nx,ny,time[nx][ny],true))
            }
        }
    }else{
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="X"{ continue }
            
            if map[nx][ny]=="D" {
                ans = curr.time+1
                break
            }
            
            if !visited[1][nx][ny]{
                if !visited[0][nx][ny]{
                    visited[1][nx][ny] = true
                    q.append((nx,ny,curr.time+1,false))
                }else if time[nx][ny] > curr.time+1{
                    visited[1][nx][ny] = true
                    q.append((nx,ny,curr.time+1,false))
                }
            }
        }
    }
    
    idx += 1
}
print(ans<0 ? "KAKTUS":ans)