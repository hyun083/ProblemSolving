import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
var total = arr.reduce(0,+)
var ans = 0

while arr.count > 1{
    let num = arr.removeLast()
    total -= num
    ans += (total*num)
}
print(ans)