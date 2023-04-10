import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var a = Array(repeating: [Int](), count: n)
var b = Array(repeating: [Int](), count: n)
var ans = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n{
    let numbers = readLine()!.split(separator: " ").map{Int($0)!}
    a[i] = numbers
}

for i in 0..<n{
    let numbers = readLine()!.split(separator: " ").map{Int($0)!}
    b[i] = numbers
}

for i in 0..<n{
    for k in 0..<m{
        ans[i][k] = a[i][k] + b[i][k]
    }
}

for i in 0..<n{
    for k in 0..<m{
        print(ans[i][k], terminator: " ")
    }
    print()
}