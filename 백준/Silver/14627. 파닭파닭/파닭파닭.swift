import Foundation

let (S,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var pa = [Int]()
var lo = 1
var hi = 1000000000
var target = 0
var ans = 0

for _ in 0..<S{
    let length = Int(readLine()!)!
    pa.append(length)
}

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0

    for length in pa{
//        if length == mid { continue }
        cnt += length/mid
    }
    if cnt<C{
        hi = mid-1
    }else{
        lo = mid+1
        target = max(target, mid)
    }
}

print(pa.reduce(0, +)-(C*target))