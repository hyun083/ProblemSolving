import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{String($0)}.filter({$0.hasSuffix("Cheese")})
print(Set(arr).count >= 4 ? "yummy":"sad")