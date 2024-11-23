import Foundation

let S = readLine()!.split(separator: " ").map{String($0)}
let A = Int(S[0])!
let B = Int(S[2])!
let res = Int(S[4])!
print(A+B==res ? "YES":"NO")