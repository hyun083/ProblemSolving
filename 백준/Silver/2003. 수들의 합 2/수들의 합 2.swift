import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 0
for i in 0..<n{
    var end = i
    var sum = 0
    while end < n{
        sum += arr[end]
        if sum == m{
            cnt += 1
            break
        }
        end += 1
    }
}
print(cnt)