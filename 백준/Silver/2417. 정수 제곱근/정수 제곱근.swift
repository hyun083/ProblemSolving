import Foundation

let N = UInt(readLine()!)!
var lo:UInt = 0
var hi = UInt(truncating: NSDecimalNumber(decimal: pow(2, 32)))-1

while lo+1<hi{
    let mid:UInt = (lo+hi)/2
    if mid*mid < N{
        lo = mid+1
    }else{
        hi = mid
    }
}
print(lo*lo<N ? lo+1:lo)