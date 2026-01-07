import Foundation

let ABC = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
let A = ABC[0]
let B = ABC[1]
let C = min(ABC[2],A+B-1)

print(A+B+C)