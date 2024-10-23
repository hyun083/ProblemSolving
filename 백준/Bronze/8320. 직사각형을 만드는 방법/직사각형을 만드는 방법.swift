import Foundation

let N = Int(readLine()!)!
var ans = 0

for i in 1...N{
    for k in 1...i{
        ans += i*k<=N ? 1:0
    }
}
print(ans)