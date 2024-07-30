import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
let TP = readLine()!.split(separator: " ").map{Int($0)!}
let T = TP[0]
let P = TP[1]

var t = 0
var p1 = N/P
var p2 = N%P

for size in arr{
    t += size/T + (size%T==0 ? 0:1)
}

print(t)
print(p1,p2)