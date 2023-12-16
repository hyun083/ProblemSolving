import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let (H,W) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    var map = [[String]]()
    var visited = Array(repeating: Array(repeating: false, count: W), count: H)
    var ans = 0
    
    for _ in 0..<H{
        let info = readLine()!.map{String($0)}
        map.append(info)
    }
    
    func bfs(x:Int, y:Int){
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        var q:[(x:Int, y:Int)] = [(x,y)]
        var idx = 0
        
        while idx<q.count{
            let curr = q[idx]
            
            for i in 0..<4{
                let nx = curr.x + dx[i]
                let ny = curr.y + dy[i]
                
                if nx<0 || nx>=H || ny<0 || ny>=W || visited[nx][ny] || map[nx][ny]=="." { continue}
                visited[nx][ny] = true
                q.append((nx,ny))
            }
            
            idx += 1
        }
    }
    
    for i in 0..<H{
        for k in 0..<W{
            if map[i][k] == "#" && !visited[i][k]{
                visited[i][k] = true
                bfs(x: i, y: k)
                ans += 1
            }
        }
    }
    print(ans)
}