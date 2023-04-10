import Foundation

var dp = [Int](0...100001)
var pow = [Int]()
for i in 1..<400{
    if i*i > 100000 {break}
    pow.append(i*i)
}

for p in pow{
    if p > 100000{break}
    for i in p..<100001{
        dp[i] = min(dp[i], dp[i-p]+1)
    }
}
let n = Int(readLine()!)!
print(dp[n])