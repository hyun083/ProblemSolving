import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]   //student
let m = nm[1]   //compare
var arr = Array(repeating: Array(repeating: false, count: n), count: n)
var check = Array(repeating: true, count: n)
for _ in 0..<m{
    let uv = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = uv[0] - 1
    let v = uv[1] - 1
    arr[u][v] = true
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if arr[u][k] && arr[k][v]{
                arr[u][v] = true
            }
        }
    }
}

for u in 0..<n{
    for v in 0..<n{
        if u==v{continue}
        if !arr[u][v] && !arr[v][u]{
            check[u] = false
            check[v] = false
        }
    }
}

var cnt = 0
for i in 0..<n{
    if check[i]{
        cnt += 1
    }
}
print(cnt)