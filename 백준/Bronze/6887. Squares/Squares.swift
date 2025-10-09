import Foundation

let N = Int(readLine()!)!
var target = 1
var ans = 0

while target*target <= N{
    ans = target
    target += 1
}

print("The largest square has side length \(ans).")