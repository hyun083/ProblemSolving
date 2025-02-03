import Foundation

let N = Int(readLine()!)!
var ans = ""
for _ in 0..<N/5{ ans += "V" }
for _ in 0..<N%5{ ans += "I" }

print(ans)