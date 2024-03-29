import Foundation

let N = Int(readLine()!)!
var D = 0
var P = 0

for _ in 0..<N{
    let winner = readLine()!
    D += winner=="D" ? 1:0
    P += winner=="P" ? 1:0
    if abs(D-P)>=2{ break }
}
print("\(D):\(P)")
