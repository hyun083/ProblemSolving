import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var x = readLine()!.split(separator: " ").map{Int($0)!}
var ans = max(x[0], N-x[M-1])

for i in 1..<M{
    let dist = x[i] - x[i-1]
    ans = max((dist+1)/2, ans)
}
print(ans)