import Foundation

let arr = readLine()!.split(separator: " ").map{Int($0)!}
let X = arr[0]
let Y = arr[1]
let Z = arr[2]
var ans = arr

ans.append(X*Y)
ans.append(X*Z)
ans.append(Y*Z)
ans.append(X*Y*Z)
ans.sort(by:{ $0%2==$1%2 ? $0>$1 : $0%2>$1%2})
print(ans[0])