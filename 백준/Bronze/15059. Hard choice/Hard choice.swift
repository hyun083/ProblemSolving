import Foundation

let CBP = readLine()!.split(separator: " ").map{Int($0)!}
let cbp = readLine()!.split(separator: " ").map{Int($0)!}
let C = CBP[0]
let B = CBP[1]
let P = CBP[2]

let c = cbp[0]
let b = cbp[1]
let p = cbp[2]

var ans = 0

ans += c-C<=0 ? 0:c-C
ans += b-B<=0 ? 0:b-B
ans += p-P<=0 ? 0:p-P
print(ans)