import Foundation

let XK = readLine()!.split(separator: " ").map{Int($0)!}
let X = XK[0], K = XK[1]
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var L = Array(repeating: 0, count: K)
var R = Array(repeating: 0, count: K)
var ans = 0

for i in 0..<X*2{
    let curr = arr[i]-1
    L[curr] += i<X ? 1 : 0
    R[curr] += i>=X ? 1 : 0
}

for i in 0..<K{
    for p in 0..<K{
        if i==p { continue }
        ans += L[i]*R[p]
    }
}
print(ans)