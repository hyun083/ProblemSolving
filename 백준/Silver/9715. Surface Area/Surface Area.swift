import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var R = 0
var C = 0

func bfs(from x:Int, y:Int) -> Int{
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var res = 2
    
    for i in 0..<4{
        let nx = x+dx[i]
        let ny = y+dy[i]
        
        if nx<0 || nx>=R || ny<0 || ny>=C{
            res += map[x][y]
            continue
        }
        
        if map[nx][ny] < map[x][y]{
            res += map[x][y] - map[nx][ny]
        }
    }
    
    return res
}

for _ in 0..<N{
    var ans = 0
    let RC = readLine()!.split(separator: " ").map{Int($0)!}
    R = RC[0]; C = RC[1]
    map = [[Int]]()
    
    for _ in 0..<R{
        let info = readLine()!.map{String($0)}.map{Int($0)!}
        map.append(info)
    }
    
    for i in 0..<R{
        for k in 0..<C{
            if map[i][k]>0{
                ans += bfs(from: i, y: k)
            }
        }
    }
    
    print(ans)
}
