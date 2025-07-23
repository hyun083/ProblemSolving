import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var cnt = 0
for i in 0..<N{
    cnt += arr[i] != i+1 ? 1:0
}
print(cnt)