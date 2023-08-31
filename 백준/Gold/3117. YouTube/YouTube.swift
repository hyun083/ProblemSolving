import Foundation

let (N,K,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1],$0[2])}[0]

let MAX = 32
var startNum = readLine()!.split(separator: " ").map{Int($0)!-1}
var parent = Array(repeating: Array(repeating: -1, count: K), count: MAX)
parent[0] = readLine()!.split(separator: " ").map{Int($0)!-1}

for level in 1..<MAX-1{
    for node in 0..<K{
        parent[level][node] = parent[level-1][parent[level-1][node]]
    }
}

for startnum in startNum{
    var m = M-1
    var curr = startnum
    
    for level in stride(from: MAX-1, through: 0, by: -1){
        if m >= 1<<level{
            m -= 1<<level
            curr = parent[level][curr]
        }
    }
    print(curr+1, terminator: " ")
}