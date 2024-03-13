import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
for num in arr{
    ans += min(N, num)
}
print(ans)
