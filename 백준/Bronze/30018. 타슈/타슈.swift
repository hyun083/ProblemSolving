import Foundation

let N = Int(readLine()!)!
var pre = readLine()!.split(separator: " ").map{Int($0)!}
var post = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

for i in 0..<N{
    let diff = post[i] - pre[i]
    ans += diff>0 ? diff:0
}
print(ans)