import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]
print(K*M+M)