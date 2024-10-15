import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var ans = 0
var idx = 1
for _ in 0..<N{
    let num = Int(readLine()!)!
    arr.append(num)
}
arr.sort(by: <)
for i in 0..<N{
    if arr[i] - idx >= 0{
        ans += arr[i]-idx
        idx += 1
    }
}
print(ans)