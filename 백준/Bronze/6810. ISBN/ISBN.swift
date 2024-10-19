import Foundation

var ans = 91
var tmp = [1,3,1]
for i in 0..<3{
    let num = Int(readLine()!)!
    ans += num * tmp[i]
}
print("The 1-3-sum is \(ans)")