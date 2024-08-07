import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var left = 0
var right = 0
var tmp = 0
var ans = 0

while right<N{
    if tmp+arr[right] <= M{
        tmp += arr[right]
        right += 1
        ans = max(ans, tmp)
    }else {
        tmp -= arr[left]
        left += 1
    }
    if left>right{
        tmp += arr[right]
        right += 1
    }
}
print(ans)