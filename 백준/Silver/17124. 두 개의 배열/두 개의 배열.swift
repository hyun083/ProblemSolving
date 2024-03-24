import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    let A = readLine()!.split(separator: " ").map{Int($0)!}
    let B = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
    var C = [Int]()
    
    for i in 0..<N{
        var lo = 0
        var hi = M-1
        var diff = Int.max
        var res = Int.max
        
        while lo<=hi{
            let mid = (lo+hi)/2
            let value = abs(B[mid]-A[i])
            
            if value < diff{
                diff = value
                res = B[mid]
            }else if value == diff{
                res = min(res, B[mid])
            }
            
            if B[mid] < A[i]{
                lo = mid+1
            }else{
                hi = mid-1
            }
        }
        
        C.append(res)
    }
    print(C.reduce(0, +))
}
