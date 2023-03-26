import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var arr = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
for i in 1...n{
    let numbers = readLine()!.split(separator: " ").map{Int($0)!}
    var sum = 0
    for k in 0..<m{
        sum += numbers[k]
        arr[i][k+1] = sum
    }
}
for k in 1...m{
    var sum = 0
    for i in 1...n{
        sum += arr[i][k]
        arr[i][k] = sum
    }
}
let k = Int(readLine()!)!
for _ in 0..<k{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    var i = line[0]
    var j = line[1]
    let x = line[2]
    let y = line[3]
    var ans = arr[x][y] - arr[x][j-1] - arr[i-1][y] + arr[i-1][j-1]
    print(ans)
}
