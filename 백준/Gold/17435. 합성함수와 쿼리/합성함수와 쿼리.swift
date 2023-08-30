import Foundation

let m = Int(readLine()!)!
let MAX = 19
var parent = Array(repeating: Array(repeating: -1, count: m), count: MAX)

parent[0] = readLine()!.split(separator: " ").map{Int($0)!-1}

for level in 1..<MAX{
    for node in 0..<m{
        parent[level][node] = parent[level-1][parent[level-1][node]]
    }
}

let Q = Int(readLine()!)!
for _ in 0..<Q{
    let nx = readLine()!.split(separator: " ").map{Int($0)!}
    var n = nx[0]
    var x = nx[1]-1
    
    for level in stride(from: MAX-1, through: 0, by: -1){
        if n >= 1<<level{
            n -= 1<<level
            x = parent[level][x]
        }
    }
    print(x+1)
}