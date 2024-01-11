import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let (x1,y1,x2,y2) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1], $0[2], $0[3])}[0]
var map = Array(repeating: Array(repeating: "", count: M), count: N)
var root:(x:Int, y:Int) = (0,0)
var target:(x:Int, y:Int) = (0,0)

for i in 0..<N{
    let info = readLine()!.map{String($0)}
    for k in 0..<M{
        map[i][k] = info[k]
        if map[i][k] == "*"{
            root = (i,k)
        }else if map[i][k] == "#"{
            target = (i,k)
        }
    }
}

var q:[(x:Int, y:Int, cost:Int)] = []
var dq = q
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var minCost = Array(repeating: Array(repeating: N*M, count: M), count: N)

minCost[root.x][root.y] = 0
q.append((root.x, root.y, 0))

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if map[curr.x][curr.y] == "#" { break }
        if minCost[curr.x][curr.y] < curr.cost{ continue }
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M{ continue }
            if map[nx][ny]=="1" || map[nx][ny]=="#"{
                if minCost[nx][ny] > curr.cost+1{
                    minCost[nx][ny] = curr.cost+1
                    q.append((nx,ny,curr.cost+1))
                }
            }else if map[nx][ny]=="0"{
                if minCost[nx][ny] > curr.cost{
                    minCost[nx][ny] = curr.cost
                    q.append((nx,ny,curr.cost))
                }
            }
        }
    }
    q.sort(by: {$0.cost < $1.cost})
}
print(minCost[target.x][target.y])