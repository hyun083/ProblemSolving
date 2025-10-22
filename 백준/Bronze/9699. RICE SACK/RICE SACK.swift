import Foundation

let T = Int(readLine()!)!
for num in 1...T{
    let value = readLine()!.split(separator: " ").map{Int($0)!}.max()!
    print("Case #\(num): \(value)")
}