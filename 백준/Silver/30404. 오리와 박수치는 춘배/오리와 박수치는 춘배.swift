import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var start = 0
var end = 0
var ans = 0

for i in 0..<N {
    if end < arr[i]{
        ans += 1
        start = arr[i]
        end = arr[i]+K
    }
}
print(ans)