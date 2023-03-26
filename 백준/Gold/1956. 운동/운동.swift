import Foundation

let ve = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = ve[0]
let e = ve[1]
var arr = Array(repeating: Array(repeating: 4000001, count: v), count: v)
for _ in 0..<e{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = edge[0]-1
    let v = edge[1]-1
    let c = edge[2]
    arr[u][v] = c
}
for k in 0..<v{
    for u in 0..<v{
        for v in 0..<v{
            arr[u][v] = min(arr[u][v], arr[u][k]+arr[k][v])
        }
    }
}
var result = 4000001
for u in 0..<v{
    for v in 0..<v{
        if u == v{
            result = min(result, arr[u][v])
        }
    }
}
print(result==4000001 ? -1 : result)