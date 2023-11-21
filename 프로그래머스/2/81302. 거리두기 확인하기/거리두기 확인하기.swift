import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var visited = Array(repeating: Array(repeating:false, count:5), count:5)
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var ans = [Int]()
    
    func bfs(x:Int, y:Int, map:[[String]]) -> Bool{
        var q = [(x:Int, y:Int, d:Int)]()
        var idx = 0
        q.append((x,y,0))
        visited[x][y] = true
        
        while idx<q.count{
            let curr = q[idx]
            
            for i in 0..<4{
                let nx = curr.x+dx[i]
                let ny = curr.y+dy[i]
                let nd = abs(x-nx) + abs(y-ny)
                
                if nx<0 || nx>=5 || ny<0 || ny>=5 || map[nx][ny]=="X" || nd>2 || visited[nx][ny]{ continue }
                visited[nx][ny] = true
                if map[nx][ny]=="O"{
                    q.append((nx,ny,nd))
                }else if map[nx][ny]=="P"{
                    return false
                }
            }
            idx += 1
        }
        
        return true
    }
    
    for place in places{
        visited = Array(repeating: Array(repeating:false, count:5), count:5)
        var map = [[String]]()
        var res = true
        
        for p in place{
            map.append(p.map{String($0)})
        }
        
        for i in 0..<5{
            for k in 0..<5{
                if map[i][k] == "P" && !visited[i][k]{
                    res = bfs(x:i, y:k, map:map) ? res:false
                }
            }
        }
        ans.append(res ? 1:0)
    }
    return ans
}