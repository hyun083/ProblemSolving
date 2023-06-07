import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = Array(repeating: Array(repeating: "O", count: M), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var q = [(x:Int, y:Int)]()
var ans = 0

for i in 0..<N{
    let info = readLine()!.map{String($0)}
    for k in 0..<M{
        arr[i][k] = info[k]
        if arr[i][k] == "I"{
            q.append((i,k))
            visited[i][k] = true
        }else if arr[i][k] == "X"{
            visited[i][k] = true
        }
    }
}

var idx = 0
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

while idx<q.count {
    let curr = q[idx]
    
    for i in 0..<4{
        let nx = curr.x + dx[i]
        let ny = curr.y + dy[i]
        
        if nx<0 || nx>=N || ny<0 || ny>=M{ continue }
        if !visited[nx][ny]{
            visited[nx][ny] = true
            q.append((nx,ny))
            ans += arr[nx][ny]=="P" ? 1:0
        }
    }
    idx += 1
}

print(ans==0 ? "TT":ans)