import Foundation

let ans = readLine()!.split(separator: " ").map{Int($0)!}
let N = ans[0]
let M = ans[1]

print(N==M ? 1:0)