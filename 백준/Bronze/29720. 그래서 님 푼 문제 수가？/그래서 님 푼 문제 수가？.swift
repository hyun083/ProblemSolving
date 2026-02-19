import Foundation

let NMK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMK[0]
let M = NMK[1]
let K = NMK[2]

let myMin = max(0,N-(M*K))
let myMax = max(0,N-(M*(K-1))-1)
print(myMin, myMax)