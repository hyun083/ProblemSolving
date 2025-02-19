import Foundation

let MN = readLine()!.split(separator: " ").map{Int($0)!}
let M = MN[0]
let N = MN[1]
let ans = String(M,radix: N).uppercased()
print(ans)