import Foundation

func solution(_ board:[[Int]]) -> Int {
    let N = board.count
    var visited = Array(repeating:Array(repeating:[Int.max,Int.max,Int.max,Int.max], count:N), count:N)
    let dx = [-1,0,1,0]
    let dy = [0,1,0,-1]
    
    var q:[(x:Int, y:Int, cost:Int, dir:Int)] = [(0,0,0,0)]
    var idx = 0
    visited[0][0] = [0,0,0,0]
    
    while idx<q.count{
        let curr = q[idx]

        for nd in 0..<4{
            let nx = curr.x + dx[nd]
            let ny = curr.y + dy[nd]
            var nc = (curr.dir - nd)%2==0 ? curr.cost+100 : curr.cost+600
            if curr.x==0 && curr.y==0 { nc = curr.cost+100}
            if nx<0 || nx>=N || ny<0 || ny>=N || visited[nx][ny][nd]<=nc || board[nx][ny]==1{ continue }
            visited[nx][ny][nd] = nc
            q.append((nx,ny,nc,nd))
        }
        
        idx += 1
    }

    return visited[N-1][N-1].min()!
}