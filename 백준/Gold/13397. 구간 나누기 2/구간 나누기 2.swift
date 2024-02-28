import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}

var lo = 0
var hi = arr.max()!
var ans = Int.max

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    var res = 0
    
    var t = arr[0]
    var T = arr[0]
    for i in 0..<N{
        t = min(t, arr[i])
        T = max(T, arr[i])
        
        if T-t > mid{
            cnt += 1
            t = arr[i]
            T = arr[i]
        }else{
            res = max(res,T-t)
        }
    }
    cnt += 1
    
    if cnt <= M{
        ans = min(ans, res)
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans)