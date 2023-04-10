import Foundation

let nmr = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nmr[0]
let m = nmr[1]
let r = nmr[2]
let item = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: 1501, count: n), count: n)
for _ in 0..<r{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = input[0]-1
    let v = input[1]-1
    let c = input[2]
    arr[u][v] = c
    arr[v][u] = c
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if u==v{continue}
            arr[u][v] = min(arr[u][v], arr[u][k]+arr[k][v])
        }
    }
}
var result = item
for u in 0..<n{
    for v in 0..<n{
        if arr[u][v]<=m{
//            print("u:\(u), result[u]:\(result[u]), item[v]:\(item[v])")
            result[u] += item[v]
        }
    }
}
print(result.max()!)