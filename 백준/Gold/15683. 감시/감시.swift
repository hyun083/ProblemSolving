import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = [[Int]]()
var cctv = [(x:Int, y:Int)]()


for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
    for k in 0..<M{
        if 0<map[i][k] && map[i][k]<6{
            cctv.append((i,k))
        }
    }
}

func blank(on arr:[[Int]]) -> Int{
    var res = 0
    
    for i in 0..<N{
        for k in 0..<M{
            res += arr[i][k]==0 ? 1:0
        }
    }
    
    return res
}

func up(from x:Int, y:Int, on arr:[[Int]]) -> [[Int]]{
    var res = arr
    var nx = x-1
    var ny = y
    
    while nx>=0{
        if res[nx][ny] == 6{
            break
        }else if res[nx][ny] > 0{
            nx -= 1
        }else if res[nx][ny] <= 0{
            res[nx][ny] = -1
            nx -= 1
        }
    }
    
    return res
}

func down(from x:Int, y:Int, on arr:[[Int]]) -> [[Int]]{
    var res = arr
    var nx = x+1
    var ny = y
    
    while nx<N{
        if res[nx][ny] == 6{
            break
        }else if res[nx][ny] > 0{
            nx += 1
        }else if res[nx][ny] <= 0{
            res[nx][ny] = -1
            nx += 1
        }
    }
    
    return res
}

func left(from x:Int, y:Int, on arr:[[Int]]) -> [[Int]]{
    var res = arr
    var nx = x
    var ny = y-1
    
    while ny>=0{
        if res[nx][ny] == 6{
            break
        }else if res[nx][ny] > 0{
            ny -= 1
        }else if res[nx][ny] <= 0{
            res[nx][ny] = -1
            ny -= 1
        }
    }
    
    return res
}

func right(from x:Int, y:Int, on arr:[[Int]]) -> [[Int]]{
    var res = arr
    var nx = x
    var ny = y+1
    
    while ny<M{
        if res[nx][ny] == 6{
            break
        }else if res[nx][ny] > 0{
            ny += 1
        }else if res[nx][ny] <= 0{
            res[nx][ny] = -1
            ny += 1
        }
    }
    
    return res
}

var ans = N*M
var q = [(arr:[[Int]], cnt:Int)]()
var idx = 0
q.append((map, 0))

while idx < q.count{
    let curr = q[idx]
    
    if curr.cnt == cctv.count{
        ans = min(ans, blank(on: curr.arr))
        idx += 1
        continue
    }
    
    let x = cctv[curr.cnt].x
    let y = cctv[curr.cnt].y
    
    if map[x][y] == 1{
        q.append((up(from: x, y: y, on: curr.arr), cnt:curr.cnt+1))
        q.append((down(from: x, y: y, on: curr.arr), cnt:curr.cnt+1))
        q.append((left(from: x, y: y, on: curr.arr), cnt:curr.cnt+1))
        q.append((right(from: x, y: y, on: curr.arr), cnt:curr.cnt+1))
    }else if map[x][y] == 2{
        let leftAndRight = right(from: x, y: y, on: left(from: x, y: y, on: curr.arr))
        let upAndDown = down(from: x, y: y, on: up(from: x, y: y, on: curr.arr))
        
        q.append((arr: leftAndRight, cnt: curr.cnt+1))
        q.append((arr: upAndDown, cnt: curr.cnt+1))
    }else if map[x][y] == 3{
        let upAndRight = up(from: x, y: y, on: right(from: x, y: y, on: curr.arr))
        let downAndRight = down(from: x, y: y, on: right(from: x, y: y, on: curr.arr))
        let downAndLeft = down(from: x, y: y, on: left(from: x, y: y, on: curr.arr))
        let upAndLeft = up(from: x, y: y, on: left(from: x, y: y, on: curr.arr))
        
        q.append((arr: upAndRight, cnt: curr.cnt+1))
        q.append((arr: downAndRight, cnt: curr.cnt+1))
        q.append((arr: downAndLeft, cnt: curr.cnt+1))
        q.append((arr: upAndLeft, cnt: curr.cnt+1))
    }else if map[x][y] == 4{
        let upAndRightAndLeft = up(from: x, y: y, on: right(from: x, y: y, on: left(from: x, y: y, on: curr.arr)))
        let upAndDownAndRight = right(from: x, y: y, on: down(from: x, y: y, on: up(from: x, y: y, on: curr.arr)))
        let downAndLeftAndRight = down(from: x, y: y, on: right(from: x, y: y, on: left(from: x, y: y, on: curr.arr)))
        let upAndDownAndLeft = left(from: x, y: y, on: down(from: x, y: y, on: up(from: x, y: y, on: curr.arr)))
        
        q.append((arr: upAndRightAndLeft, cnt: curr.cnt+1))
        q.append((arr: upAndDownAndRight, cnt: curr.cnt+1))
        q.append((arr: downAndLeftAndRight, cnt: curr.cnt+1))
        q.append((arr: upAndDownAndLeft, cnt: curr.cnt+1))
    }else if map[x][y] == 5{
        let all = up(from: x, y: y, on: down(from: x, y: y, on: left(from: x, y: y, on: right(from: x, y: y, on: curr.arr))))
        q.append((all,curr.cnt+1))
    }
    
    idx += 1
}
print(ans)
