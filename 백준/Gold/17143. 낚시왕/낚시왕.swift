import Foundation

let (R,C,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var sharks = [(r:Int, c:Int, speed:Int, direction:Int, size:Int, isDead:Bool)]()
var map = Array(repeating: Array(repeating: -1, count: C), count: R)
var newMap = Array(repeating: Array(repeating: -1, count: C), count: R)
var dx = [-1,1,0,0]
var dy = [0,0,1,-1]

for idx in 0..<M{
    let (r,c,s,d,z) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2], $0[3]-1, $0[4])}[0]
    sharks.append((r,c,s,d,z,false))
    map[r][c] = idx
}

func proc(col:Int) -> Int{
    var idx = -1
    for i in 0..<R{
        if map[i][col] >= 0{
            idx = map[i][col]
            return idx
        }
    }
    return idx
}

func move(){
    for idx in 0..<M{
        var curr = sharks[idx]
        if curr.isDead{ continue }
        map[curr.r][curr.c] = -1
        let move = curr.direction<2 ? curr.speed%(2*(R-1)):curr.speed%(2*(C-1))
        
        for _ in 0..<move{
            if curr.r + dx[curr.direction] >= R{
                curr.r -= 1
                curr.direction = 0
            }else if curr.r + dx[curr.direction] < 0{
                curr.r += 1
                curr.direction = 1
            }else if curr.c + dy[curr.direction] >= C{
                curr.c -= 1
                curr.direction = 3
            }else if curr.c + dy[curr.direction] < 0{
                curr.c += 1
                curr.direction = 2
            }else{
                curr.r += dx[curr.direction]
                curr.c += dy[curr.direction]
            }
        }
        sharks[idx] = curr
        if newMap[curr.r][curr.c] >= 0{
            let T = newMap[curr.r][curr.c]
            if sharks[T].size < sharks[idx].size {
                newMap[curr.r][curr.c] = idx
                sharks[T].isDead = true
            }else{
                sharks[idx].isDead = true
            }
        }else{
            newMap[curr.r][curr.c] = idx
        }
    }
    map = newMap
    newMap = Array(repeating: Array(repeating: -1, count: C), count: R)
}


var ans = 0
for position in 0..<C{
    let idx = proc(col: position)
    if idx >= 0{
        ans += sharks[idx].size
        sharks[idx].isDead = true
    }
    move()
}
print(ans)