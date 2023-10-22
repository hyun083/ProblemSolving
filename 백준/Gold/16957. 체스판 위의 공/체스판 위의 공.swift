import Foundation

let (R,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = [[Int]]()
var ans = Array(repeating: Array(repeating: 0, count: C), count: R)

for _ in 0..<R{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

var arr = Array(repeating: -1, count: R*C)

func root(of node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    let ax = a/C
    let ay = a%C
    
    let bx = b/C
    let by = b%C
    if map[ax][ay] > map[bx][by]{
        arr[B] += arr[A]
        arr[A] = B
    }else{
        arr[A] += arr[B]
        arr[B] = A
    }
}

func bfs(from x:Int, y:Int){
    var target = map[x][y]
    var tx = x
    var ty = y
    
    let dx = [-1,-1,-1,0,0,1,1,1]
    let dy = [-1,0,1,-1,1,-1,0,1]
    
    for i in 0..<8{
        let nx = x+dx[i]
        let ny = y+dy[i]
        
        if nx<0 || nx>=R || ny<0 || ny>=C{ continue }
        if target > map[nx][ny]{
            target = map[nx][ny]
            tx = nx
            ty = ny
        }
    }
    
    union(a: x*C+y, b: tx*C+ty)
}

for i in 0..<R{
    for k in 0..<C{
        bfs(from: i, y: k)
    }
}

for i in 0..<R*C{
    print(arr[i]<0 ? -1*arr[i]:0,terminator: " ")
    if (i+1)%C==0{ print() }
}