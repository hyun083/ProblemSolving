import Foundation

let score = readLine()!.split(separator: " ").map{Int($0)!}
var name = ["Soongsil","Korea","Hanyang"]
let idx = score.firstIndex(of: score.min()!)!
let sum = score.reduce(0, +)
print(sum >= 100 ? "OK":name[idx])