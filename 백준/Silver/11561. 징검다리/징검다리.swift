import Foundation

let T = UInt(readLine()!)!

for _ in 0..<T{
    let N = UInt(readLine()!)!
    
    var lo:UInt = 1
    var hi:UInt = N
    var ans:UInt = 0
    
    while lo<=hi{
        let mid = (lo+hi)/2
        if (mid) <= (2*N)/(mid+1){
            ans = max(ans, mid)
            lo = mid+1
        }else{
            hi = mid-1
        }
    }
    print(ans)
}