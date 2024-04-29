import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = [[String]]()
var flag = false
var ans = 0
var dir = 4

for _ in 0..<N{
    let line = readLine()!.map{String($0)}
    map.append(line)
}
let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]

func dfs(rx:Int, ry:Int, rd:Int){
    let dx = [-1,0,1,0]
    let dy = [0,1,0,-1]
    var q = [(x:Int, y:Int, d:Int)]()
    var idx = 0
    
    q.append((rx,ry,rd))
    
    while idx < q.count{
        let curr = q[idx]
        
        var nd = curr.d
        if map[curr.x][curr.y]=="/"{
            if nd == 0{
                nd = 1
            }else if nd == 1{
                nd = 0
            }else if nd == 2{
                nd = 3
            }else{
                nd = 2
            }
        }else if map[curr.x][curr.y]=="\\"{
            if nd == 0{
                nd = 3
            }else if nd == 1{
                nd = 2
            }else if nd == 2{
                nd = 1
            }else{
                nd = 0
            }
        }
        
        let nx = curr.x + dx[nd]
        let ny = curr.y + dy[nd]
        
        if nx<0 || nx>=N || ny<0 || ny>=M || map[nx][ny]=="C"{
            if ans <= idx+1{
                dir = rd
                ans = idx+1
            }
            return
        }
        
        if idx > N*M*2{
            ans = N*M*2
            dir = rd
            flag = true
            return
        }
        
        q.append((nx,ny,nd))
        idx += 1
    }
}
dfs(rx: x, ry: y, rd: 3)
dfs(rx: x, ry: y, rd: 2)
dfs(rx: x, ry: y, rd: 1)
dfs(rx: x, ry: y, rd: 0)
print(dir==0 ? "U":dir==1 ? "R": dir==2 ? "D":"L")
print(flag ? "Voyager":"\(ans)")