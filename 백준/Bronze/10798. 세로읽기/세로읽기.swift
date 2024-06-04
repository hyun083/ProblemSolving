import Foundation

var map = [[String]]()
var cnt = 0

for _ in 0..<5{
    let line = readLine()!.map{String($0)}
    map.append(line)
    cnt = max(cnt, line.count)
}

for i in 0..<cnt{
    for k in 0..<5{
        if map[k].count > i{
            print(map[k][i],terminator: "")
        }
    }
}