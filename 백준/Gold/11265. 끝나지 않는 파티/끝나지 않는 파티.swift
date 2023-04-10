import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = [[Int]]()
for _ in 0..<n{
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if u==v{continue}
            arr[u][v] = min(arr[u][v], arr[u][k]+arr[k][v])
        }
    }
}
for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = line[0]-1
    let v = line[1]-1
    let c = line[2]
    if arr[u][v] <= c{
        print("Enjoy other party")
    }else{
        print("Stay here")
    }
}