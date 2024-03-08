import Foundation

let (N,K,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = [Int]()

for _ in 0..<N{
    let L = Int(readLine()!)!
    if L<=K{ continue }
    arr.append(L)
}
var lo = 1
var hi = 1000000000
var ans = -1

while lo<=hi{
    let P = (lo+hi)/2
    var cnt = 0
    
    for L in arr{
        cnt += L<2*K ? (L-K)/P:(L-(2*K))/P
    }
    
    if cnt >= M{
        ans = P
        lo = P+1
    }else{
        hi = P-1
    }
}
print(ans)