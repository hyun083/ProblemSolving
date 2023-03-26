import Foundation

let A = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}

var inc = Array(repeating: 1, count: A)
var dec = Array(repeating: 0, count: A)
var ans = Array(repeating: 0, count: A)

for i in 0..<A{
    let target = arr[i]
    for k in 0..<i{
        if arr[k] < target{
            inc[i] = max(inc[i], inc[k]+1)
        }
    }
    ans[i] += inc[i]
}

for i in (0..<A).reversed(){
    let target = arr[i]
    for k in (i..<A).reversed(){
        if arr[k] < target{
            dec[i] = max(dec[i], dec[k]+1)
        }
    }
    ans[i] += dec[i]
}

print(ans.max()!)