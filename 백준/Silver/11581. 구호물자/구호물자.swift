import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: false, count: N), count: N)
var ans = true

for u in 0..<N-1{
    let _ = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int($0)!-1}
    for v in arr{
        map[u][v] = true
    }
}

for i in 0..<N{
    for k in 0..<N{
        for p in 0..<N{
            if map[i][k] && map[k][p]{
                map[i][p] = true
            }
        }
    }
}

for i in 0..<N{
    if map[i][i] && map[0][i]{
        ans = false
        break
    }
}
print(ans ? "NO CYCLE":"CYCLE")