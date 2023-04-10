import Foundation

var ans = 0
let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<m{
        map[i][k] = line[k]
    }
}

let dx = [[0,0,0],[1,2,3],[0,1,1],[1,2,2],
          [0,0,1],[0,1,2],[0,0,-1],[1,1,2],
          [0,-1,-1],[0,0,1],[0,-1,1],[0,-1,0],
          [1,1,2],[1,1,2],[0,1,1],[0,-1,-2],
          [0,0,1],[0,1,2],[1,1,1]]

let dy = [[1,2,3],[0,0,0],[1,0,1],[0,0,1],
          [1,2,0],[1,1,1],[1,2,2],[0,1,1],
          [1,1,2],[1,2,1],[1,1,1],[1,1,2],
          [0,1,0],[0,-1,-1],[1,1,2],[1,1,1],
          [1,2,2],[1,0,0],[0,1,2]]

func poliomino(x:Int, y:Int) -> Int{
    var result = 0
    for i in 0..<19{
        var temp = map[x][y]
        for k in 0..<3{
            let nx = x + dx[i][k]
            let ny = y + dy[i][k]
            if nx<0 || nx>=n || ny<0 || ny>=m{
                temp = 0
                break
            }
            temp += map[nx][ny]
        }
        result = max(result, temp)
    }
    return result
}
for i in 0..<n{
    for k in 0..<m{
        ans = max(ans, poliomino(x: i, y: k))
    }
}
print(ans)