import Foundation

var curr = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: 3), count: 3)
var ans = 0
for _ in 0..<9{
    let XY = readLine()!.split(separator: " ").map{Int($0)!}
    let X = XY[0]-1
    let Y = XY[1]-1
    map[X][Y] = curr
    for i in 0..<3{
        if map[i][0]==curr && map[i][1]==curr && map[i][2]==curr{
            ans = curr
        }
    }
    for k in 0..<3{
        if map[0][k]==curr && map[1][k]==curr && map[2][k]==curr{
            ans = curr
        }
    }
    if map[0][0]==curr && map[1][1]==curr && map[2][2]==curr{
        ans = curr
    }
    if map[2][0]==curr && map[1][1]==curr && map[0][2]==curr{
        ans = curr
    }
    curr = curr==2 ? 1:2
    if ans > 0{ break }
}
print(ans)