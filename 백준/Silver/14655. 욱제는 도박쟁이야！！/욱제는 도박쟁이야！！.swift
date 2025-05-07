import Foundation

let N = Int(readLine()!)!
let MM = readLine()!.split(separator: " ").map{abs(Int($0)!)}.reduce(0, +)
let mm = readLine()!.split(separator: " ").map{-1*abs(Int($0)!)}.reduce(0, +)
print(MM-mm)