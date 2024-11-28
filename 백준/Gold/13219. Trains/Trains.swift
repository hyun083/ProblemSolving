import Foundation

let INF = Int.max
let N = Int(readLine()!)!
var info = readLine()!.split(separator: " ").map{Int($0)!-1}
let Ax = info[1], Ay = info[0]
let Bx = info[3], By = info[2]

var map = [[Int]]()
var ans = Array(repeating: Array(repeating: INF, count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N{
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(arr)
}

ans[Ax][Ay] = map[Ax][Ay]
var q = [(x:Int, y:Int, dist:Int)]()
q.append((Ax, Ay, map[Ax][Ay]))

while !q.isEmpty{
    let (x, y, dist) = q.removeLast()
    if visited[x][y] { continue }
    if dist > ans[x][y]{ continue }
    
    visited[x][y] = true
    
    for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
        let nx = x + dx, ny = y + dy
        if nx < 0 || nx >= N || ny < 0 || ny >= N || map[nx][ny]<0{ continue }
        let newCost = dist + map[nx][ny]
        if newCost < ans[nx][ny]{
            ans[nx][ny] = newCost
            q.append((nx, ny, newCost))
        }
    }
    
    q.sort(by: {$0.dist > $1.dist})
}
print(map[Ax][Ay]<0 || map[Bx][By]<0 || ans[Bx][By]==INF ? -1:ans[Bx][By])