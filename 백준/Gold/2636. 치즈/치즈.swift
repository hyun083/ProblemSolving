import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = [[Int]]()
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append(info)
}

var q = Array(repeating: [(x:Int,y:Int)](), count: 51)
var cnt = Array(repeating: 0, count: 51)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

q[0].append((0,0))
visited[0][0] = true

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func bfs(currTime:Int){
    while !q[currTime].isEmpty{
        let curr = q[currTime].removeFirst()
        arr[curr.x][curr.y] = 0
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M { continue }
            if !visited[nx][ny]{
                visited[nx][ny] = true
                if arr[nx][ny] == 0{
                    q[currTime].append((nx,ny))
                }else{
                    cnt[currTime] += 1
                    q[currTime+1].append((nx,ny))
                }
            }
        }
    }

    if cnt[currTime] > 0{
        bfs(currTime: currTime+1)
    }else{
        print(currTime)
        print(cnt[currTime-1])
    }
}

bfs(currTime: 0)