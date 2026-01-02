import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var map = [[String]]()
var row = Array(repeating: false, count: N)
var col = Array(repeating: false, count: M)

for i in 0..<N{
    let line = readLine()!.map{String($0)}
    map.append(line)
    
    for k in 0..<M{
        if map[i][k] == "X"{
            row[i] = true
            col[k] = true
        }
    }
}
print(max(row.filter{$0==false}.count, col.filter{$0==false}.count))