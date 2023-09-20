import Foundation

let (N,M,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]

var visited = Array(repeating:Array(repeating: Array(repeating: false, count: M), count: N), count:2)
var arr = Array(repeating: Array(repeating: Int(), count: M), count: N)
var gram:(x:Int, y:Int) = (-1,-1)

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<M{
        arr[i][k] = info[k]
        if arr[i][k] == 2{
            gram = (i,k)
        }
    }
}

var ans = Int.max
func bfs(){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q = [(x:Int, y:Int, t:Int, getGram:Bool)]()
    var idx = 0
    
    visited[0][0][0] = true
    q.append((0,0,0,false))
    
    while idx < q.count{
        var curr = q[idx]
        
        if curr.t > T{ return }
        
        if curr.x == N-1 && curr.y == M-1{
            ans = min(ans, curr.t)
        }
        
        if curr.x == gram.x && curr.y == gram.y{
            curr.getGram = true
        }
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M{ continue }
            if curr.getGram{
                if !visited[1][nx][ny]{
                    visited[1][nx][ny] = true
                    q.append((nx,ny,curr.t+1,curr.getGram))
                }
            }else if arr[nx][ny]%2==0{
                if !visited[0][nx][ny]{
                    visited[0][nx][ny] = true
                    q.append((nx,ny,curr.t+1,curr.getGram))
                }
            }
        }
        
        idx += 1
    }
}
bfs()
print(ans==Int.max||ans>T ? "Fail":ans)