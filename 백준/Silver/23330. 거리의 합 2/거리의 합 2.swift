import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var ans = 0

var sum = 0

for i in 0..<N {
    sum += abs(arr[i] - arr[0])
}
ans += sum

for i in 1..<N {
    let diff = arr[i] - arr[i-1]
    sum = sum + (diff * i) - (diff * (N-i))
    ans += sum
}
print(ans)