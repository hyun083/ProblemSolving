import Foundation

let N = Int(readLine()!)!
var tmp = String(N, radix: 2)
let rev = String(tmp.reversed())
print(Int(rev, radix: 2)!)