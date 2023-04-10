import Foundation
let nx = [1,-1,0,0]
let ny = [0,0,-1,1]

func dfs(_ x:Int, _ y:Int) -> Int{
    var cnt = 0
    visited[x][y] = 1
    cnt += 1
    
    for i in 0..<4{
        let X = x + nx[i]
        let Y = y + ny[i]
        if(X < 0 || X >= M || Y < 0 || Y >= N){
            continue
        }
        if(map[X][Y] == 1 && visited[X][Y] == 0){
            cnt += dfs(X, Y)
        }
    }
    return cnt
}

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let M = inputs[0]
let N = inputs[1]
let K = inputs[2]

var map = Array(repeating: Array(repeating: 1, count: N), count: M)
var visited = Array(repeating: Array(repeating: 0, count: N), count: M)

for _ in 1...K{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    for x in stride(from: inputs[1], to: inputs[3], by: 1){
        for y in stride(from: inputs[0], to: inputs[2], by: 1){
            map[x][y] = 0
        }
    }
}

var cntArr = Array<Int>()

for x in 0..<M{
    for y in 0..<N{
        if(map[x][y] == 1 && visited[x][y] == 0){
            cntArr.append(dfs(x, y))
        }
    }
}
print(cntArr.count)

for cnt in cntArr.sorted(by: <){
    print(cnt, terminator: " ")
}