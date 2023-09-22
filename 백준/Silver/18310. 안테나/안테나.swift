import Foundation

let N = Int(readLine()!)!
let house = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
print(house[(N-1)/2])