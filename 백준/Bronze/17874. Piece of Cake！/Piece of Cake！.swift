import Foundation

let NHV = readLine()!.split(separator: " ").map{Int($0)!}
let N = NHV[0]
let H = NHV[1]
let V = NHV[2]

let ans = max(N-H,H)*max(N-V,V)*4
print(ans)