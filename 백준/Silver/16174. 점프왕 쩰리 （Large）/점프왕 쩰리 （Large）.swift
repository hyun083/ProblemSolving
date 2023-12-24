import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

var q:[(x:Int, y:Int)] = [(0,0)]
var idx = 0
let dx = [0,1]
let dy = [1,0]
var ans = "Hing"

while idx<q.count{
    let curr = q[idx]
    if curr.x==N-1 && curr.y==N-1 {
        ans = "HaruHaru"
        break
    }
    
    for i in 0..<2{
        let dist = map[curr.x][curr.y]
        let nx = curr.x+dx[i]*dist
        let ny = curr.y+dy[i]*dist
        
        if nx>=N || ny>=N || visited[nx][ny] { continue }
        visited[nx][ny] = true
        q.append((nx,ny))
    }
    
    idx += 1
}

print(ans)