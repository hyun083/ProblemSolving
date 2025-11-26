import Foundation

let XY = readLine()!.split(separator: " ").map{Int($0)!}
let A = String(repeating: "1", count: XY[0])
let B = String(repeating: "1", count: XY[1])
print(Int(A)!+Int(B)!)