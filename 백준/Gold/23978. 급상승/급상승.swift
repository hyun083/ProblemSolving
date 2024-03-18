import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)

var lo = 0
var hi = 10000000000/2
var ans = 0

func prefix(from n:Int) -> Int{
    return n*(n+1)/2
}

while lo<=hi{
    let mid = (lo+hi)/2
    var sum = prefix(from: mid)
    
    for i in 1..<N{
        let diff = prefix(from: max(mid-(arr[i]-arr[i-1]),0) )
        sum += prefix(from: mid)-diff
    }
    
    if sum >= K{
        ans = mid
        hi = mid-1
    }else{
        lo = mid+1
    }
}

print(ans)
