import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var curr = 0
var ans = 0

for i in 0..<N{
    if arr[i] == curr{
        ans += 1
        curr = (curr+1)%3
    }
}

print(ans)