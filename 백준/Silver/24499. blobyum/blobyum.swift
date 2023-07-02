import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
var pies = readLine()!.split(separator: " ").map{Int($0)!}
let N = info[0]
let K = info[1]
pies += pies[0..<K]

var ans = 0
var sum = 0
var cnt = 0

for i in 0..<N+K {
    if cnt < K{
        cnt += 1
        sum += pies[i]
    }else{
        sum -= pies[i-K]
        sum += pies[i]
    }
    ans = max(ans, sum)
}
print(ans)