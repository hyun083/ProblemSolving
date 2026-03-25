import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: false, count: 501), count: 501)
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x1 = info[0], y1 = info[1], x2 = info[2], y2 = info[3]
    
    for x in x1..<x2{
        for y in y1..<y2{
            map[x][y] = true
        }
    }
}
var ans = 0
for i in 0..<501{
    for k in 0..<501{
        ans += map[i][k] ? 1:0
    }
}
print(ans)