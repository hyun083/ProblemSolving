import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}

var target = 1
for i in 0..<N{
    if arr[i] == target {
        target += 1
    }
}
print(N-target+1)