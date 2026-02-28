import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var ans = 0

ans += M*(N-1)
ans += N*(M-1)
ans += 2*((M-1)*(N-1))
print(ans)