import Foundation

let NMS = readLine()!.split(separator: " ").map { Int64($0)! }
let N = NMS[0]
let M = NMS[1]
let S = NMS[2]

let total = S*(M+1)
let priceWithPercent = (total * (100-N)) / 100
let ans = min(priceWithPercent, S*M)
print(ans)