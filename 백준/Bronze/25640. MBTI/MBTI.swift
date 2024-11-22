import Foundation

let S = readLine()!
let N = Int(readLine()!)!
var ans = 0

for _ in 0..<N{
    let info = readLine()!
    ans += S==info ? 1:0
}
print(ans)