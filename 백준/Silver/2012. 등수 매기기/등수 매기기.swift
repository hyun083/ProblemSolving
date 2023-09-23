import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
arr.sort()
var ans = 0
for i in 0..<N{
    ans += abs(i-arr[i]+1)
}
print(ans)