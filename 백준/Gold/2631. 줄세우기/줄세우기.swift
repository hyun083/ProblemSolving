import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}

var ans = Array(repeating: 1, count: N)
for i in 0..<N{
    let target = arr[i]
    for k in 0..<i{
        if arr[k] < target{
            ans[i] = max(ans[i], ans[k]+1)
        }
    }
}

print(N-ans.max()!)