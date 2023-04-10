import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr1 = Array(repeating: Array(repeating: 0, count: n), count: n)
var arr2 = Array(repeating: Array(repeating: 0, count: n), count: n)
for _ in 0..<m{
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!-1}
    let a = ab[0]
    let b = ab[1]
    arr1[a][b] = 1
    arr2[b][a] = 1
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if u==v{continue}
            if arr1[u][k]==1 && arr1[k][v]==1{
                arr1[u][v] = 1
            }
            if  arr2[v][k]==1 && arr2[k][u]==1{
                arr2[v][u] = 1
            }
        }
    }
}
var cnt = 0
for i in 0..<n{
    if arr1[i].reduce(0, +)>=(n+1)/2 || arr2[i].reduce(0, +)>=(n+1)/2{
        cnt += 1
    }
}
print(cnt)