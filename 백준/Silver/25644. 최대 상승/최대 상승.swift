import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
var mn = arr[0]

for num in arr{
    if num <= mn{
        mn = num
    }else{
        ans = max(ans, num-mn)
    }
}
print(ans)
