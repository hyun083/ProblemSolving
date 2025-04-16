import Foundation

let RC = readLine()!.split(separator: " ").map{Int($0)!}
let R = RC[0]
let C = RC[1]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count:C),count:R)

for _ in 0..<R{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

func bfs(rx:Int, ry:Int) -> Int{
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q = [(x:Int, y:Int)]()
    var dq = [(x:Int, y:Int)]()
    
    var sum = map[rx][ry]
    
    visited[rx][ry] = true
    q.append((rx,ry))

    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if curr == (R-1,C-1){ return sum }
            var target = 0
            var tx = 0
            var ty = 0
            
            for i in 0..<4{
                let nx = curr.x + dx[i]
                let ny = curr.y + dy[i]
                
                if nx<0 || ny<0 || nx>=R || ny>=C || visited[nx][ny]{ continue }
                
                if map[nx][ny] > target{
                    target = map[nx][ny]
                    tx = nx
                    ty = ny
                }
            }
            visited[tx][ty] = true
            q.append((tx,ty))
            sum += target
        }
    }
    return sum
}

print(bfs(rx:0,ry:0))