import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var S = readLine()!.split(separator: " ").map{Int($0)!}
let D = readLine()!.split(separator: " ").map{Int($0)!}

for _ in 0..<K{
    var tmp = Array(repeating: 0, count: N)
    for idx in 0..<N{
        let target = D[idx]-1
        tmp[target] = S[idx]
    }
    S = tmp
}

for num in S{
    print(num, terminator: " ")
}