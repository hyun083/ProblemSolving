import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var left = 0
var right = N-1
var ans = 0

while left<right && left<N && 0<=right{
    if arr[left] + arr[right] <= K{
        ans += 1
        left += 1
        right -= 1
    }else{
       right -= 1
    }
}
print(ans)