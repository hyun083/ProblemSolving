import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [Int]()
var lo = Int.max
var hi = Int.min
var ans = 0

for _ in 0..<N{
    let x = Int(readLine()!)!
    arr.append(x)
    lo = min(lo, x)
    hi = max(hi, x)
}
hi += K

while lo <= hi{
    let mid = (lo+hi)/2
    var res = 0
    for level in arr{
        if mid <= level{ continue }
        res += mid-level
    }
    
    if res<=K{
        ans = mid
        lo = mid+1
    }else{
        hi = mid-1
    }
}
print(ans)