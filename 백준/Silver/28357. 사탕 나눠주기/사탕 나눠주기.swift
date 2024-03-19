
import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var score = readLine()!.split(separator: " ").map{Int($0)!}

var lo = 0
var hi = 2*1000000000000
var ans = 0

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    
    for num in score{
        cnt += max((num-mid),0)
    }
    if cnt<=K{
        ans = mid
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans)
