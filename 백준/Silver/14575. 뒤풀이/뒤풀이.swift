import Foundation

let (N,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [(lo:Int, hi:Int)]()
var L = 0

for _ in 0..<N{
    let (m,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((m,M))
    L += m
}

var lo = 1
var hi = T
var ans = -1

while lo<=hi{
    let mid = (lo+hi)/2
    var sum = 0
    var flag = true
    
    for info in arr{
        if info.lo <= mid{
            sum += min(info.hi, mid)
        }else{
            flag = false
            break
        }
    }
    
    if sum<T || !flag{
        lo = mid+1
    }else{
        ans = mid
        hi = mid-1
    }
}

print(L>T ? -1:ans)