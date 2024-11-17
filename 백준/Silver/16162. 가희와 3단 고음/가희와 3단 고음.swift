import Foundation

let NAD = readLine()!.split(separator: " ").map{Int($0)!}
let N = NAD[0], A = NAD[1], D = NAD[2]
var ans = 0
var curr = A

var arr = readLine()!.split(separator: " ").map{Int($0)!}
for note in arr{
    if note == curr{
        ans += 1
        curr += D
    }
}
print(ans)