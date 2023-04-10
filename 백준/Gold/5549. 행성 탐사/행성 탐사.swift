import Foundation

let mn = readLine()!.split(separator: " ").map{Int($0)!}
let m = mn[0]
let n = mn[1]
let k = Int(readLine()!)!
var ans = ""

var map = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: n+1), count: m+1)
for i in 1...m{
    let info = readLine()!.map{String($0)}
    for k in 0..<n{
        switch info[k]{
        case "J":
            map[i][k+1][0] = 1
        case "O":
            map[i][k+1][1] = 1
        case "I":
            map[i][k+1][2] = 1
        default:
            continue
        }
    }
}

for i in 1...m{
    for k in 1...n{
        map[i][k][0] += (map[i-1][k][0] + map[i][k-1][0] - map[i-1][k-1][0])
        map[i][k][1] += (map[i-1][k][1] + map[i][k-1][1] - map[i-1][k-1][1])
        map[i][k][2] += (map[i-1][k][2] + map[i][k-1][2] - map[i-1][k-1][2])
    }
}

for _ in 0..<k{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let a = line[0]-1
    let b = line[1]-1
    let c = line[2]
    let d = line[3]
    ans += "\(map[c][d][0]+map[a][b][0]-map[a][d][0]-map[c][b][0]) \(map[c][d][1]+map[a][b][1]-map[a][d][1]-map[c][b][1]) \(map[c][d][2]+map[a][b][2]-map[a][d][2]-map[c][b][2])\n"
}
print(ans)