import Foundation

let N = Int(readLine()!)!

var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var min = 100
var max = 0
for i in 0..<N{
    map[i] = (readLine()!.split(separator: " ").map{Int(String($0))!})
    for m in map[i]{
        min = min > m ? m : min
        max = max < m ? m : max
    }
}

let nx = [1,-1,0,0]
let ny = [0,0,-1,1]

func dfs(_ x:Int, _ y:Int,_ r:Int){
    visited[x][y] = true
    for i in 0...3{
        let X = x+nx[i]
        let Y = y+ny[i]
        if(X<0 || X>=N || Y<0 || Y>=N){
            continue
        }
        if(map[X][Y]>r && visited[X][Y]==false){
            dfs(X, Y, r)
        }
    }
}

var counts = Array<Int>()
for r in min...max{
    visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var cnt = 0
    for x in 0..<N{
        for y in 0..<N{
            if(map[x][y] > r && visited[x][y]==false){
                cnt += 1
                dfs(x, y, r)
            }
        }
    }
    counts.append(cnt)
}
if(counts.max()! == 0){
    print(1)
}else{
    print(counts.max()!)
}