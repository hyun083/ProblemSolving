import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
var K = NK[1]

var arr = [0]+readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var left = 0
var right = N
var ans = 0

while left<right && 0<K{
    ans += arr[right] - arr[left]
    left += 1
    right -= 1
    K -= 2
}
print(ans)