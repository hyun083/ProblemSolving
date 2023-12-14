import Foundation

let (R,C,N) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var map = [[String]]()
var q = [(x:Int, y:Int)]()
var time = 0

for _ in 0..<R{
    let info = readLine()!.map{String($0)}
    map.append(info)
}

func plant(){
    for i in 0..<R{
        for k in 0..<C{
            if map[i][k] == "."{
                map[i][k] = "O"
            }else{
                q.append((i,k))
            }
        }
    }
    time += 1
}

func bomb(){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    while !q.isEmpty{
        let curr = q.removeLast()
        map[curr.x][curr.y] = "."
        
        for i in 0..<4{
            let nx = curr.x+dx[i]
            let ny = curr.y+dy[i]
            
            if nx<0 || nx>=R || ny<0 || ny>=C{ continue }
            map[nx][ny] = "."
        }
    }
    
    time += 1
}

time += 1
while time < N{
    plant()
    if time == N { break }
    bomb()
}

for i in 0..<R{
    print(map[i].joined())
}