import Foundation

let N = Int(readLine()!)!
var cows = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
var ans = 0

for cow in cows{
    ans += ans<=cow ? 1:0
}
print(ans)