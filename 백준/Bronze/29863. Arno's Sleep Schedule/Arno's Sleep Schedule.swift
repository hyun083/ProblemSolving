import Foundation

var S = Int(readLine()!)!
let E = Int(readLine()!)!
S -= S>=20 ? 24:0
print(E-S)