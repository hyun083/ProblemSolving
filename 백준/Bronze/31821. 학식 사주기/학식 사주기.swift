import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var ans = 0
for _ in 0..<N{
    let price = Int(readLine()!)!
    arr.append(price)
}
let M = Int(readLine()!)!
for _ in 0..<M{
    let idx = Int(readLine()!)!-1
    ans += arr[idx]
}
print(ans)