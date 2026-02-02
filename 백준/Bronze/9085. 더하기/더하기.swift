import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let _ = Int(readLine()!)!
    let sum = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
    print(sum)
}