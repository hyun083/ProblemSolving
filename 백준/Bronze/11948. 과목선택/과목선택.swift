import Foundation

var ans = 0
var arr = [Int]()
for _ in 0..<4{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: >)
arr.removeLast()
ans += arr.reduce(0, +)
arr.removeAll()

for _ in 0..<2{
    arr.append((Int(readLine()!)!))
}
ans += arr.max()!
print(ans)