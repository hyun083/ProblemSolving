import Foundation

let MN = readLine()!.split(separator: " ").map{Int($0)!}
let M = MN[0]
let N = MN[1]
let ULRD = readLine()!.split(separator: " ").map{Int($0)!}
let U = ULRD[0]
let L = ULRD[1]
let R = ULRD[2]
let D = ULRD[3]
var arr = [[String]]()

for _ in 0..<M{
    arr.append(readLine()!.map{String($0)})
}

var map = Array(repeating: Array(repeating: "", count: N+L+R), count: M+U+D)
for i in 0..<M+U+D{
    var tmp = i%2==0 ? "#":"."
    for k in 0..<N+L+R{
        map[i][k] = tmp
        tmp = tmp=="#" ? "." : "#"
    }
}

for i in U..<U+M{
    for k in L..<L+N{
        map[i][k] = arr[i-U][k-L]
    }
}

for ans in map{
    print(ans.joined())
}