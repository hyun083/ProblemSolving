import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}

var two = 0
var sum = arr.reduce(0, +)

for num in arr{
    two += num/2
}
print(sum%3 != 0 ? "NO" : two >= sum/3 ? "YES":"NO")