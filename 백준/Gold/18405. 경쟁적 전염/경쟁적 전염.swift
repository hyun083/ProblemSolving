import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var arr = Array(repeating: Array(repeating: 0, count: N), count: N)
var q = Array(repeating: [(x:Int,y:Int)](), count: K+1)

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<N{
        let num = info[k]
        arr[i][k] = num
        if num > 0{
            q[num].append((i,k))
        }
    }
}

let SXY = readLine()!.split(separator: " ").map{Int($0)!}
var S = SXY[0]
let X = SXY[1]-1
let Y = SXY[2]-1

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
while S>0{
    for num in 1...K{
        for _ in 0..<q[num].count{
            let curr = q[num].removeFirst()
            if curr.x==X && curr.y==Y{ break }
            
            for i in 0..<4{
                let nx = curr.x+dx[i]
                let ny = curr.y+dy[i]
                
                if nx<0 || nx>=N || ny<0 || ny>=N { continue }
                if arr[nx][ny] == 0{
                    arr[nx][ny] = num
                    q[num].append((nx,ny))
                }
            }
        }
    }
    S -= 1
}

print(arr[X][Y])