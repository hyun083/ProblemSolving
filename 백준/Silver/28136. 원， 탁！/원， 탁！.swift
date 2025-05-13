import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

for i in 0..<N-1{
    let curr = arr[i]
    let next = arr[i+1]
    if curr >= next{
        ans += 1
    }
}
ans += arr[N-1]>=arr[0] ? 1:0
print(ans)