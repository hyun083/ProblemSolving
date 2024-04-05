import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var start:(x:Int, y:Int) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var ans = Array(repeating: Array(repeating: -1, count: N), count: N)

var q = [(x:Int, y:Int, cost:Int)]()
var idx = 0

let dx = [-2,-2,-1,-1,1,1,2,2]
let dy = [-1,1,-2,2,-2,2,-1,1]

visited[start.x][start.y] = true
q.append((start.x, start.y,0))

while idx < q.count{
    let curr = q[idx]
    
    for i in 0..<8{
        let nx = curr.x + dx[i]
        let ny = curr.y + dy[i]
        
        if nx<0 || nx>=N || ny<0 || ny>=N || visited[nx][ny]{ continue }
        visited[nx][ny] = true
        ans[nx][ny] = curr.cost+1
        q.append((nx,ny,curr.cost+1))
    }
    
    idx += 1
}

for _ in 0..<M{
    let (X,Y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    print(ans[X][Y])
}