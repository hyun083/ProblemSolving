import Foundation

let NMAK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMAK[0]
let M = NMAK[1]
let A = NMAK[2]
let K = NMAK[3]

let minValue = min(N,A-K+1)
let maxValue = (A-K)%M==0 ? (A-K)/M:(A-K)/M+1
print(minValue,maxValue+1)