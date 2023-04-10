import Foundation

let t = Int(readLine()!)!
for _ in 0..<t{
    var ans = -1
    let wh = readLine()!.split(separator: " ").map{Int($0)!}
    let w = wh[0]
    let h = wh[1]
    var map = Array(repeating: Array(repeating: "", count: w), count: h)
    var visited = Array(repeating: Array(repeating: 0, count: w), count: h)
    
    var start = [[Int]]()
    var fire = [[Int]]()
    for i in 0..<h{
        let input = readLine()!.map{String($0)}
        for k in 0..<w{
            map[i][k] = input[k]
            if map[i][k] == "@"{ start.append([i,k]) }
            if map[i][k] == "*"{ fire.append([i,k]) }
        }
    }

    func bfs(s:[[Int]], f:[[Int]]){
        var q = f
        var dq = [[Int]]()
        var level = 0
        var fire_check = Array(repeating: Array(repeating: false, count: w), count: h)
        
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        
        while !q.isEmpty{
            dq = q.reversed()
            q.removeAll()
            for _ in 0..<dq.count{
                let curr = dq.removeLast()
                let x = curr[0]
                let y = curr[1]
                visited[x][y] = level
                fire_check[x][y] = true
                for i in 0..<4{
                    let nx = x+dx[i]
                    let ny = y+dy[i]
                    
                    if nx<0 || nx>=h || ny<0 || ny>=w || map[nx][ny]=="#"{ continue }
                    if !fire_check[nx][ny]{
                        fire_check[nx][ny] = true
                        q.append([nx,ny])
                    }
                }
            }
            level += 1
        }
        
        q = start
        dq = [[Int]]()
        level = 0
        var move_check = Array(repeating: Array(repeating: false, count: w), count: h)
        
        while !q.isEmpty{
            dq = q.reversed()
            q.removeAll()
            for _ in 0..<dq.count{
                let curr = dq.removeLast()
                let x = curr[0]
                let y = curr[1]
                move_check[x][y] = true

                if x==0 || x==h-1 || y==0 || y==w-1{
                    ans = level+1
                    return
                }
                for i in 0..<4{
                    let nx = x+dx[i]
                    let ny = y+dy[i]
                    if nx<0 || nx>=h || ny<0 || ny>=w || map[nx][ny]=="#"{ continue }
                    if visited[nx][ny] > level+1 && !move_check[nx][ny]{
                        move_check[nx][ny] = true
                        q.append([nx,ny])
                    }
                    if !fire_check[nx][ny] && !move_check[nx][ny]{
                        move_check[nx][ny] = true
                        q.append([nx,ny])
                    }
                }
            }
            level += 1
        }
    }
    bfs(s: start, f: fire)
    print(ans == -1 ? "IMPOSSIBLE":ans)
}