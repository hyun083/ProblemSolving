import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var left = 0
var right = N-1
var ans = 0

while left<right{
    let num = arr[left] + arr[right]
    if num >= M{
        ans += 1
        left += 1
        right -= 1
    }else{
        left += 1
    }
}
print(ans)