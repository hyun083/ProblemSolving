import Foundation

let N = Int(readLine()!)!
var ans = 0
for _ in 0..<N{
    let line = readLine()!
    ans += line.contains("01") || line.contains(String("OI")) ? 1 : 0
}
print(ans)