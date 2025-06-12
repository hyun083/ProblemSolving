import Foundation

let NH = readLine()!.split(separator: " ").map{Int($0)!}
let N = NH[0]
let H = NH[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
var cnt = 0

for d in arr{
    ans += d
    cnt += 1
    if ans >= H{
        break
    }
}
print(ans >= H ? cnt:-1)