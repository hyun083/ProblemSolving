import Foundation

let N = Int(readLine()!)!
var ans = 0

for num in 1...N{
    ans += (num*num*num)
}
print(ans)