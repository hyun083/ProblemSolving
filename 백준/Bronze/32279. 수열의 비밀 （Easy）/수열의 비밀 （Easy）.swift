import Foundation

let N = Int(readLine()!)!
let PQRS = readLine()!.split(separator: " ").map{Int($0)!}
let P = PQRS[0], Q = PQRS[1], R = PQRS[2], S = PQRS[3]
var arr = Array(repeating: 0, count: N+1)
arr[1] = Int(readLine()!)!

for i in 1...N{
    if 2<=2*i && 2*i<=N{
        arr[2*i] = P*arr[i]+Q
    }
    if 3<=2*i+1 && 2*i+1<=N{
        arr[2*i+1] = R*arr[i]+S
    }
}
print(arr.reduce(0, +))