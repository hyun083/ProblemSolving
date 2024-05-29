import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var map = Array(repeating: Array(repeating: 0, count: 101), count: 101)
var ans = 0

for _ in 0..<N{
    let (x1,y1,x2,y2) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2], $0[3])}[0]
    for nx in x1...x2{
        for ny in y1...y2{
            if map[nx][ny] > M { continue }
            map[nx][ny] += 1
            if map[nx][ny] > M{
                ans += 1
            }
        }
    }
}

print(ans)