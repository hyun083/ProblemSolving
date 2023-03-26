import Foundation

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]
var map = Array(repeating: Array(repeating: false, count: n), count: n)
for _ in 0..<k{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = input[0] - 1
    let v = input[1] - 1
    map[u][v] = true
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if map[u][k] && map[k][v]{
                map[u][v] = true
            }
        }
    }
}
for _ in 0..<Int(readLine()!)!{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = input[0] - 1
    let v = input[1] - 1
    
    if map[u][v] && !map[v][u]{
        print(-1)
    }else if !map[u][v] && !map[v][u]{
        print(0)
    }else{
        print(1)
    }
    
}