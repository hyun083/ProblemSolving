import Foundation

let B = Int(readLine()!)!
let P = 5*B-400
let level = P==100 ? 0:
            P<100 ? 1:-1
print(P)
print(level)