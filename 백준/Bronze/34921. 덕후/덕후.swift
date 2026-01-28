import Foundation

let AT = readLine()!.split(separator: " ").map{Int($0)!}
let A = AT[0]
let T = AT[1]

let ans = max(0,10+2*(25-A+T))
print(ans)