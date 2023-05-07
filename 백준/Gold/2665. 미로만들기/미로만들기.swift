import Foundation

let INF = 2500
let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: Int(), count: N), count: N)
var minCost = Array(repeating: Array(repeating: INF, count: N), count: N)

for i in 0..<N{
    let line = readLine()!.map{Int(String($0))!}
    for k in 0..<N{
        arr[i][k] = line[k]
    }
}

func dijk(){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    
    var q = [(x:Int,y:Int,cost:Int)]()
    q.append((0,0,0))
    
    while !q.isEmpty{
        q.sort(by: {$0.cost>$1.cost})
        
        let curr = q.removeLast()
        let x = curr.x
        let y = curr.y
        visited[x][y] = true
        if x==N-1 && y==N-1{ return }
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=N { continue }
            if visited[nx][ny] { continue }
            
            let newCost = arr[nx][ny]==1 ? curr.cost:curr.cost+1
            if minCost[nx][ny] > newCost{
                minCost[nx][ny] = newCost
                q.append((nx,ny,newCost))
            }
        }
    }
}

dijk()
print(minCost[N-1][N-1])