import Foundation

let (N,M,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var lo = 0
var hi = arr.max()!*2
var ans = Int.max

while lo<=hi{
    let mid = (lo+hi)/2
    var bus = 0
    var cnt = 1
    var pre = arr[0]
    var res = 0
    
    for i in 1..<N{
        if arr[i]-pre > mid || cnt+1>C{
            res = max(res, arr[i-1]-pre)
            pre = arr[i]
            cnt = 1
            bus += 1
        }else{
            cnt += 1
        }
    }
    res = max(res, arr.last!-pre)
    bus += 1
    
    if bus<=M {
        ans = min(res, ans)
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans)