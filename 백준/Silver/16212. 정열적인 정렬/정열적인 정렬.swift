import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
for num in arr{
    print(num, terminator: " ")
}