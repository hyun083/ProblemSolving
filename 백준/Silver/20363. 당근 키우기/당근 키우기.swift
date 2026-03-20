import Foundation

let XY = readLine()!.split(separator: " ").map{Int($0)!}
let X = XY[0]
let Y = XY[1]
var ans = X+Y
ans += min(X,Y)/10
print(ans)