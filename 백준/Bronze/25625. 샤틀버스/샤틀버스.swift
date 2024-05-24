import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let X = info[0]
let Y = info[1]

print(Y>=X ? Y-X:X+Y)