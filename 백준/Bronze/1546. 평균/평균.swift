import Foundation

let N = Double(readLine()!)!
let scores = readLine()!.split(separator: " ").map{Double(String($0))!}
let total = scores.reduce(0, +)/scores.max()!*100
print(total/N)