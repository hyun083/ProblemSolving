import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
let ans = arr.reduce(0, +) - arr.max()!
print(ans)