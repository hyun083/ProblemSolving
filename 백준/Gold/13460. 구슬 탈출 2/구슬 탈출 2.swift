import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = Array(repeating: Array(repeating: "", count: M), count: N)
var dest = (x:Int(),y:Int())
var RED = (x:Int(),y:Int())
var BLUE = (x:Int(),y:Int())
var CNT = 0

for i in 0..<N{
    let info = readLine()!.map{String($0)}
    for k in 0..<M{
        arr[i][k] = info[k]
        switch arr[i][k]{
        case "O":
            dest.x = i
            dest.y = k
            break
        case "R":
            arr[i][k] = "."
            RED.x = i
            RED.y = k
            break
        case "B":
            arr[i][k] = "."
            BLUE.x = i
            BLUE.y = k
            break
        default:
            break
        }
        
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var q = [(red:(x:Int,y:Int), blue:(x:Int,y:Int), cnt:Int)]()
q.append((RED,BLUE,0))

func bfs(){
    var idx = 0
    while idx < q.count{
        let curr = q[idx]
        let red = curr.red
        let blue = curr.blue
        
        if curr.cnt > 10{
            RED = red
            BLUE = blue
            CNT = curr.cnt
            return
        }
        
        for i in 0..<4{
            var nrx = red.x
            var nry = red.y
            var rMove = 0
            
            var nbx = blue.x
            var nby = blue.y
            var bMove = 0
            
            while arr[nrx+dx[i]][nry+dy[i]] != "#"{
                nrx += dx[i]
                nry += dy[i]
                rMove += 1
                if arr[nrx][nry] == "O"{ break }
            }
            
            while arr[nbx+dx[i]][nby+dy[i]] != "#"{
                nbx += dx[i]
                nby += dy[i]
                bMove += 1
                if arr[nbx][nby] == "O"{ break }
            }
            
            if arr[nbx][nby]=="O"{ continue }
            if arr[nrx][nry]=="O"{
                RED = (nrx,nry)
                BLUE = (nbx,nby)
                CNT = curr.cnt+1
                return
            }
            
            if nrx==nbx && nry==nby{
                if rMove > bMove{
                    nrx -= dx[i]
                    nry -= dy[i]
                }else{
                    nbx -= dx[i]
                    nby -= dy[i]
                }
            }
            
            let nextRed = (nrx,nry)
            let nextBlue = (nbx,nby)
            q.append((nextRed,nextBlue,curr.cnt+1))
        }
        
        idx += 1
    }
}

bfs()
print(CNT>10||BLUE==dest ? -1:CNT)