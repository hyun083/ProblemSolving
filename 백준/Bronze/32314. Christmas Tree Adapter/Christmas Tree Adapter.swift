import Foundation

let A = Int(readLine()!)!
let WV = readLine()!.split(separator: " ").map{Int($0)!}
let W = WV[0]
let V = WV[1]

print(W/V >= A ? 1:0)