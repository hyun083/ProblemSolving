import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: (visited:Bool(),num:Int()), count: N), count: N)

func bfs(){
    var q:[(x:Int,y:Int)] = [(0,0)]
    var idx = 0
    
    let dx = [1,0]
    let dy = [0,1]
    
    while idx < q.count{
        let curr = q[idx]
        let n = arr[curr.x][curr.y].num
        
        for i in 0..<2{
            let nx = curr.x + (n*dx[i])
            let ny = curr.y + (n*dy[i])
            
            if nx>=N || ny>=N { continue }
            if !(arr[nx][ny].visited){
                arr[nx][ny].visited = true
                q.append((nx,ny))
            }
        }
        
        idx += 1
    }
}

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<N{
        arr[i][k] = (false, info[k])
    }
}

bfs()
print(arr[N-1][N-1].visited==true ? "HaruHaru":"Hing")