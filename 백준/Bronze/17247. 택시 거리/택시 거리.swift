import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = [[Int]]()
var point = [(Int,Int)]()
for i in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(line)
    for k in 0..<M{
        if map[i][k] == 1{
            point.append((i,k))
        }
    }
}
print(abs(point[0].0-point[1].0)+abs(point[0].1-point[1].1))