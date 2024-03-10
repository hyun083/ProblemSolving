import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let time = readLine()!.split(separator: " ").map{Int($0)!}

var lo = 0
var hi = 60000000000
var T = 0

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    
    for i in 0..<M{
        cnt += (mid/time[i])+1
    }
    
    if cnt >= N{
        T = mid
        hi = mid-1
    }else{
        lo = mid+1
    }
}

var cnt = 0
var ans = 0

for i in 0..<M{
    cnt += ((T-1)/time[i]+1)
}

for i in 0..<M{
    cnt += ((T/time[i])+1) - ((T-1)/time[i]+1)
    if cnt == N{
        ans = i+1
        break
    }
}

print(T==0 ? N:ans)
