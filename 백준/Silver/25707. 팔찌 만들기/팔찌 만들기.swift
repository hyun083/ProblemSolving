import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var ans = 0

for i in 0..<N-1{
    ans += arr[i+1]-arr[i]
}
ans += arr[N-1]-arr[0]
print(ans)