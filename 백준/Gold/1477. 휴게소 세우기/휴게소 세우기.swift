import Foundation

let (N,M,L) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var rest = [0] + readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <) + [L]
var lo = 1
var hi = L

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    
    for i in 1..<rest.count{
        let range = rest[i] - rest[i-1] - 1
        cnt += range/mid
    }
    
    if cnt <= M{
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(lo)