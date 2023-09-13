import Foundation

let (M,N) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: Array(repeating: false, count: N), count: M)
var arr = [[Int]]()
var ans = 0

for _ in 0..<M{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append(info)
}

func bfs(from root:(x:Int,y:Int)){
    let dx = [-1,-1,-1,0,0,1,1,1]
    let dy = [-1,0,1,-1,1,-1,0,1]
    var q = [root]
    var idx = 0
    
    while idx < q.count{
        let curr = q[idx]
        
        for i in 0..<8{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=M || ny<0 || ny>=N{ continue }
            if !visited[nx][ny] && arr[nx][ny]==1{
                visited[nx][ny] = true
                q.append((nx,ny))
            }
        }
        
        idx += 1
    }
}

for i in 0..<M{
    for k in 0..<N{
        if !visited[i][k] && arr[i][k]==1{
            visited[i][k] = true
            bfs(from: (i,k))
            ans += 1
        }
    }
}
print(ans)