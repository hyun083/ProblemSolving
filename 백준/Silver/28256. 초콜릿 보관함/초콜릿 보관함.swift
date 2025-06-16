import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    var map = [[String]]()
    var visited = Array(repeating: Array(repeating: false, count: 3), count: 3)
    visited[1][1] = true
    for _ in 0..<3{
        let info = readLine()!.map{String($0)}
        map.append(info)
    }
    
    var target = readLine()!.split(separator: " ").map{Int($0)!}
    target.removeFirst()
    
    func bfs(x:Int, y:Int) -> Int{
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        var q = [(x:Int,y:Int)]()
        var idx = 0
        q.append((x,y))
        while idx < q.count{
            let curr = q[idx]
            
            for i in 0..<4{
                let nx = curr.x + dx[i]
                let ny = curr.y + dy[i]
                if nx<0 || ny<0 || nx>=3 || ny>=3 || visited[nx][ny] || map[nx][ny]=="X"{
                    continue
                }
                
                visited[nx][ny] = true
                q.append((nx,ny))
            }
            
            idx += 1
        }
        return idx
    }
    var ans = [Int]()
    for i in 0..<3{
        for k in 0..<3{
            if !visited[i][k] && map[i][k]=="O"{
                visited[i][k] = true
                ans.append(bfs(x: i, y: k))
            }
        }
    }
    print(ans.sorted(by: <) == target ? 1:0)
}