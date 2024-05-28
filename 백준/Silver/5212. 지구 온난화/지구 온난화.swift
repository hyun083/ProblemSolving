import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let R = line[0]
let C =  line[1]

var map = [[String]]()
for _ in 0..<R{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

func cnt(x:Int, y:Int) -> Int{
    var res = 0
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for i in 0..<4{
        let nx = x+dx[i]
        let ny = y+dy[i]
        
        if nx<0 || nx>=R || ny<0 || ny>=C || map[nx][ny]=="."{
            res += 1
        }
    }
    
    return res
}

var minX = Int.max
var minY = Int.max
var maxX = 0
var maxY = 0

for i in 0..<R{
    for k in 0..<C{
        if map[i][k]=="X"{
            if cnt(x: i, y: k) < 3{
                minX = min(minX, i)
                minY = min(minY, k)
                maxX = max(maxX, i)
                maxY = max(maxY, k)
            }else{
                map[i][k] = "*"
            }
        }
    }
}

for i in minX...maxX{
    for k in minY...maxY{
        print(map[i][k]=="*" ? ".":map[i][k],terminator: "")
    }
    print()
}