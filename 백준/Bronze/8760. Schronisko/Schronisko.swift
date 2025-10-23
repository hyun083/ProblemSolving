import Foundation

let Z = Int(readLine()!)!
for _ in 0..<Z{
    let WK = readLine()!.split(separator: " ").map{Int($0)!}
    let W = WK[0]
    let K = WK[1]
    print(W*K/2)
}