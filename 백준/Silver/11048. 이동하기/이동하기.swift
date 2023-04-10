import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n{
    let numbers = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<m{
        if i==0{
            map[i][k] = k==0 ? numbers[k]:map[i][k-1]+numbers[k]
        }else{
            map[i][k] = k==0 ? map[i-1][k]+numbers[k]:max(max(map[i-1][k-1], map[i][k-1]), map[i-1][k])+numbers[k]
        }
    }
}
print(map[n-1][m-1])