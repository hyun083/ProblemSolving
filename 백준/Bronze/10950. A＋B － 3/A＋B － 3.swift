import Foundation

for _ in 0..<Int(readLine()!)!{
    let sum = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
    print(sum)
}