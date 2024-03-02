import Foundation

let (N,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var bus = [Int]()
for _ in 0..<N{
    let (S,I,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    for i in 0..<C{
        bus.append(S+(i*I))
    }
}
bus.sort(by: <)

var lo = 0
var hi = bus.count-1
var ans = -1

while lo<=hi{
    let mid = (lo+hi)/2
    
    if T <= bus[mid]{
        ans = bus[mid]-T
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans)