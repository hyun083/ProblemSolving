import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var unactive = [(x:Int, y:Int)]()
var blank = 0

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<N{
        map[i][k] = info[k]
        if map[i][k] == 2{ unactive.append((i,k)) }
        if map[i][k]%2 == 0{ blank += 1 }
    }
}

func bfs(from virus:[(x:Int, y:Int)]) -> Int{
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var q = [(x:Int, y:Int, t:Int)]()
    var idx = 0
    var res = 0
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for virus in virus{
        visited[virus.x][virus.y] = true
        q.append((virus.x , virus.y, 0))
    }
    
    while idx < q.count{
        let curr = q[idx]
        if map[curr.x][curr.y]%2 == 0{ res = curr.t }

        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=N { continue }
            if !visited[nx][ny] && map[nx][ny] != 1{
                visited[nx][ny] = true
                q.append((nx,ny,curr.t+1))
            }
        }
        
        idx += 1
    }
    
    return idx==blank || blank==0 ? res:-1
}

var collected = Array(repeating: false, count: unactive.count)
var ans = 2501
func dfs(from curr:Int, arr:[(x:Int, y:Int)]){
    var arr = arr
    if arr.count == M{
        let time = bfs(from: arr)
        if time < 0 { return }
        ans = min(ans, time)
        return
    }
    
    for next in curr+1..<unactive.count{
        arr.append(unactive[next])
        dfs(from: next, arr: arr)
        arr.removeLast()
    }
}

dfs(from: 0, arr: [unactive[0]])
dfs(from: 0, arr: [])
print(ans==2501 ? -1:ans)