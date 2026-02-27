import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var cntOf = Array(repeating: 0, count: M+1)
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

for num in arr {
    cntOf[num] += 1
    ans = max(ans,cntOf[num])
}
print(ans)