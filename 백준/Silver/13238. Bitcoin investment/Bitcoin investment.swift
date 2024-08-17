import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

for i in 0..<N-1{
    for k in i+1..<N{
        ans = max(arr[k]-arr[i],ans)
    }
}
print(ans)