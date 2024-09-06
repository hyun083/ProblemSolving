import Foundation

let N = Int(readLine()!)!
var ans = Int(readLine()!)!
for _ in 0..<N-1{
    let delta = Int(readLine()!)!
    ans += delta
}
print(ans)