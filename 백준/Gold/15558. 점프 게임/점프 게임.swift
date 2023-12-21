import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: N), count: 2)

for _ in 0..<2{
    let info = readLine()!.map{Int(String($0))!}
    map.append(info)
}

visited[0][0] = true
var q:[(x:Int, y:Int)] = [(0,0)]
var dq:[(x:Int, y:Int)] = []
let dx = [0,0,1,-1]
let dy = [1,-1,K,K]
var ans = 0
var turn = 0

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if curr.y < turn { continue }
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=2 || ny<0 { continue }
            if ny >= N { ans = 1; break }
            if map[nx][ny]==0 || visited[nx][ny]{ continue }
            visited[nx][ny] = true
            q.append((nx,ny))
        }
    }
    turn += 1
    if ans == 1{ break }
}
print(ans)