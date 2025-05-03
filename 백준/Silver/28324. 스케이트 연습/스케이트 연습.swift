import Foundation

let N = Int(readLine()!)!
let arr:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()

var ans = 0
var curr = 0

for V in arr{
    curr = min(curr+1, V)
    ans += curr
}
print(ans)