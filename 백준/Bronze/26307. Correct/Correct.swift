import Foundation

let HHMM = readLine()!.split(separator: " ").map{Int($0)!}
let HH = HHMM[0]
let MM = HHMM[1]

var ans = 0
ans += (HH-9)*60
ans += MM
print(ans)