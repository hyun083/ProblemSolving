import Foundation

let DHM = readLine()!.split(separator: " ").map{Int($0)!}
let D = DHM[0]
let H = DHM[1]
let M = DHM[2]
var ans = 0

ans += (D-11) * 24 * 60
ans += H*60
ans += M

ans -= 11*60
ans -= 11

print(ans<0 ? -1:ans)