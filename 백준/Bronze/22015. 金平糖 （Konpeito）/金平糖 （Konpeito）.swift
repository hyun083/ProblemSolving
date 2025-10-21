import Foundation

let arr = readLine()!.split(separator: " ").map{Int($0)!}
let ans = arr.map{arr.max()! - $0}.reduce(0, +)
print(ans)