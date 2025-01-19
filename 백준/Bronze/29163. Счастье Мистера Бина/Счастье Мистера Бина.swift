import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var cnt = 0

for num in arr{
    cnt += num%2==0 ? 1:-1
}
print(cnt > 0 ? "Happy":"Sad")