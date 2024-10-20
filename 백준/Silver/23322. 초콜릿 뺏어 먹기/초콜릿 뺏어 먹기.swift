import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
var day = 0

while arr[0] < arr[N-1]{
    day += 1
    ans += arr[N-1]-arr[0]
    arr[N-1] = arr[0]
    arr.sort(by: <)
}
print(ans,day)