import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let NM = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NM[0]
    let M = NM[1]
    var map = [[String]]()
    var visited = Array(repeating: Array(repeating: (N*M)+1, count: M), count: N)
    var dep:(x:Int, y:Int) = (0,0)
    var goals = [(x:Int,y:Int)]()

    for i in 0..<N{
        let info = readLine()!.map{String($0)}
        map.append(info)
        for k in 0..<M{
            if map[i][k] == "S"{
                dep = (i,k)
            }else if map[i][k] == "G"{
                goals.append((i,k))
            }
        }
    }
    
    func bfs(rx:Int, ry:Int){
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        
        var q = [(x:Int, y:Int, dist:Int)]()
        var idx = 0
        
        visited[rx][ry] = 0
        q.append( (x:rx, y:ry, dist:0) )
        while idx < q.count{
            let curr = q[idx]
            
            for i in 0..<4{
                let nx = curr.x + dx[i]
                let ny = curr.y + dy[i]
                
                if nx<0 || nx>=N || ny<0 || ny>=M || map[nx][ny] == "X"{ continue }
                if visited[nx][ny] > curr.dist+1{
                    visited[nx][ny] = curr.dist+1
                    q.append((x:nx, y:ny, dist:curr.dist+1))
                }
            }
            idx += 1
        }
    }
    var ans = N*M+1
    bfs(rx: dep.x, ry: dep.y)
    for goal in goals {
        ans = min(ans, visited[goal.x][goal.y])
    }
    if ans > N*M{
        print("No Exit")
    }else{
        print("Shortest Path: \(ans)")
    }
}