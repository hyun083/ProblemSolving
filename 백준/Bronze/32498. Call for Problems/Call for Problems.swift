import Foundation

let N = Int(readLine()!)!
var ans = 0
for _ in 0..<N{
    ans += Int(readLine()!)! % 2 == 0 ? 0:1
}
print(ans)