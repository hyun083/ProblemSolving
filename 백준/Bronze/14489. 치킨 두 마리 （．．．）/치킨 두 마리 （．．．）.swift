import Foundation

let N = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
let chicken = Int(readLine()!)!

print(2*chicken>N ? N:N-chicken*2)