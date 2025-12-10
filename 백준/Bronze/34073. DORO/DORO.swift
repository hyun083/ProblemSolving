import Foundation

let N = Int(readLine()!)!
let words = readLine()!.split(separator: " ").map{$0 + "DORO"}
print(words.joined(separator: " "))