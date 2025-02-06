import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]-1

var map = Array(repeating: Array(repeating: 0, count: M), count: N)
let dx = K/M
let dy = K%M

if K >= 0{
    map[0][0] = 1
    for i in 0...dx{
        for k in 0...dy{
            var nx = i+1
            var ny = k
            if nx <= dx && ny <= dy{
                map[nx][ny] += map[i][k]
            }
            nx = i
            ny = k+1
            if nx <= dx && ny <= dy{
                map[nx][ny] += map[i][k]
            }
        }
    }
    let tmp = map[dx][dy]
    map = Array(repeating: Array(repeating: 0, count: M), count: N)
    map[dx][dy] = tmp
    for i in dx..<N{
        for k in dy..<M{
            var nx = i+1
            var ny = k
            if nx < N && ny < M{
                map[nx][ny] += map[i][k]
            }
            nx = i
            ny = k+1
            if nx < N && ny < M{
                map[nx][ny] += map[i][k]
            }
        }
    }
    let res = map[N-1][M-1]
    print(res)
}else{
    map[0][0] = 1
    for i in 0..<N{
        for k in 0..<M{
            var nx = i+1
            var ny = k
            if nx < N && ny < M{
                map[nx][ny] += map[i][k]
            }
            nx = i
            ny = k+1
            if nx < N && ny < M{
                map[nx][ny] += map[i][k]
            }
        }
    }
    print(map[N-1][M-1])
}