import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)

func cnt(from S:Int, to E:Int) -> Int{
    if (arr[N-1]<S) || (E<arr[0]) { return 0 }
    var lo = 0
    var hi = N-1
    var startIdx = 0
    var endIdx = 0
    
    while lo<=hi{
        let mid = (lo+hi)/2
        
        if arr[mid] < S{
            lo = mid+1
        }else{
            startIdx = mid
            hi = mid-1
        }
    }
    
    lo = 0
    hi = N-1
    
    while lo<=hi{
        let mid = (lo+hi)/2
        
        if arr[mid] <= E{
            endIdx = mid
            lo = mid+1
        }else{
            hi = mid-1
        }
    }
    return endIdx - startIdx + 1
}

for _ in 0..<M{
    let (start,end) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    print(cnt(from: start, to: end))
}