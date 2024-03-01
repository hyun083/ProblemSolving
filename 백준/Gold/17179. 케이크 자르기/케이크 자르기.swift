import Foundation

let (N,M,L) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var point = [0]

for _ in 0..<M{
    point.append(Int(readLine()!)!)
}
point.append(L)

for _ in 0..<N{
    let target = Int(readLine()!)!
    
    var lo = 0
    var hi = L
    var ans = 0
    
    while lo<=hi{
        let mid = (lo+hi)/2
        var pre = point[0]
        var cnt = 0
        var res = L
        
        for i in 1..<point.count{
            if point[i]-pre >= mid{
                res = min(res, point[i]-pre)
                pre = point[i]
                cnt += 1
            }
        }
        
        if cnt >= target+1{
            ans = mid
            lo = mid+1
        }else{
            hi = mid-1
        }
    }
    
    print(ans)
}