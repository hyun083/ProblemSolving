import Foundation

while let line = readLine() {
    let WH = line.split(separator: " ").map{Int($0)!}
    let W = WH[0]
    let H = WH[1]
    
    if W+H == 0{ break }
    
    var map = [[String]]()
    var visited = Array(repeating: Array(repeating: false, count: W), count: H)
    var rx = -1
    var ry = -1
    for x in 0..<H{
        let info = readLine()!.map{String($0)}
        map.append(info)
        for y in 0..<W{
            if map[x][y] == "@"{
                rx = x
                ry = y
            }
        }
    }
    
    func dfs(rx:Int, ry:Int) -> Int{
        var idx = 0
        var q = [(x:Int, y:Int)]()
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        var res = 1
        
        q.append((rx,ry))
        visited[rx][ry] = true
        
        while idx < q.count{
            let curr = q[idx]
            
            for i in 0..<4{
                let nx = curr.x + dx[i]
                let ny = curr.y + dy[i]
                
                if nx<0 || ny<0 || nx>=H || ny>=W || map[nx][ny]=="#"{ continue }
                if !visited[nx][ny]{
                    visited[nx][ny] = true
                    res += 1
                    q.append((nx,ny))
                }
            }
            idx += 1
        }
        
        return res
    }
    print(dfs(rx: rx, ry: ry))
}