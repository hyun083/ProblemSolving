import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let S = info[0]
let D = info[1]
let I = info[2]
let L = info[3]
let N = info[4]
let ans = 4*N <= S + D + I + L ? 0 : (4*N) - (S + D + I + L)
print(ans)