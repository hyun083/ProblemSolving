import Foundation

let WHK = readLine()!.split(separator: " ").map{Int($0)!}
let W = WHK[0]
let H = WHK[1]
let K = WHK[2]
var h = [Int]()
var w = [Int]()

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var pre = 0
for i in 0..<N{
    let num = arr[i]
    h.append(num-pre)
    pre = num
}
h.append(H-pre)

let M = Int(readLine()!)!
arr = readLine()!.split(separator: " ").map{Int($0)!}
pre = 0
for i in 0..<M{
    let num = arr[i]
    w.append(num-pre)
    pre = num
}
w.append(W-pre)

h.sort()
w.sort()

var ans = 0
var idx = M
for i in 0..<N+1{
    while idx>=0 && h[i]*w[idx] > K{
        idx -= 1
    }
    if idx < 0 { break }
    ans += (idx+1)
}
print(ans)