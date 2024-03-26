import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Double($0)!}.sorted(by: <)
var cnt = 0

for i in 0..<N{
    let file = arr[i]
    var lo = i
    var hi = N-1
    var res = -1
    
    while lo<=hi{
        let mid = (lo+hi)/2
        
        if file<=arr[mid] && file>=0.9*arr[mid]{
            res = mid
            lo = mid+1
        }else{
            hi = mid-1
        }
    }
    
    cnt += res - i
}
print(cnt)