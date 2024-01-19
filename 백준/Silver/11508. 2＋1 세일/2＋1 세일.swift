import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var ans = 0

for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: >)

for i in 0..<N{
    if (i+1)%3==0{ continue }
    ans += arr[i]
}
print(ans)