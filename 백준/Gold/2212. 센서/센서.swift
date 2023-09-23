import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var arr = [Int]()

for i in 0..<num.count-1{
    arr.append(num[i+1] - num[i])
}
arr.sort(by: <)

var ans = 0
var idx = 0

while idx < N-K{
    ans += arr[idx]
    idx += 1
}
print(ans)