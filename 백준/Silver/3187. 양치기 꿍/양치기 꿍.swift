import Foundation

let (R,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var visited = Array(repeating: Array(repeating: false, count: C), count: R)
var map = [[String]]()
var wolf = 0
var lamb = 0

for _ in 0..<R{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

func bfs(x:Int, y:Int){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q:[(x:Int, y:Int)] = [(x,y)]
    var idx = 0
    var V = 0
    var K = 0
    
    while idx<q.count{
        let curr = q[idx]
        V += map[curr.x][curr.y]=="v" ? 1:0
        K += map[curr.x][curr.y]=="k" ? 1:0
        
        for i in 0..<4{
            let nx = curr.x+dx[i]
            let ny = curr.y+dy[i]
            
            if nx<0 || nx>=R || ny<0 || ny>=C || visited[nx][ny] || map[nx][ny]=="#"{ continue }
            visited[nx][ny] = true
            q.append((nx,ny))
        }
        idx += 1
    }
    wolf += V>=K ? V:0
    lamb += V<K ? K:0
}

for i in 0..<R{
    for k in 0..<C{
        if map[i][k] != "#" && !visited[i][k]{
            visited[i][k] = true
            bfs(x: i, y: k)
        }
    }
}
print(lamb,wolf)